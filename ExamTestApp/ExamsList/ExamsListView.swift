//
//  ExamsListView.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct ExamsListView {
    @StateObject var container: ExamsListContainer
    
    init(
        networService: NetworkServiceProtocol
    ) {
        let model = ExamsListModel()
        let intent = ExamsListIntent(model: model, networService: networService)
        let container = ExamsListContainer(
            model: model as ExamsListModelStateProtocol,
            intent: intent as ExamsListIntentProtocol,
            modelChangePublisher: model.objectWillChange
        )
            self._container = StateObject(wrappedValue: container)
        }
    
    private var intent: ExamsListIntentProtocol {
        container.intent
    }
    
    private var state: ExamsListModelStateProtocol {
        container.model
    }
}

extension ExamsListView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressBar(progress: Binding.constant(state.progress))
            titleView
            examsView
            nextButton
        }
        .padding()
        .task {
            await intent.load()
        }
        .toastView(toast: $container.toast)
    }
    
    private var titleView: some View {
        HStack(alignment: VerticalAlignment.center) {
            SharedAssets.Icons.icon.image
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(height: 100)
            
            Text("Какие предметы вы планируете сдавать?")
                .bold()
                .foregroundStyle(Color.black)
                .multilineTextAlignment(TextAlignment.leading)
        }
    }
    
    private var examsView: some View {
        VStack {
            ForEach(state.items) { item in
                ExamView(model: item)
                    .onTapGesture {
                        intent.selectExam(by: item.id)
                    }
            }
        }
    }
    
    private var nextButton: some View {
        Button(
            action: intent.applySelection,
            label: { nextButtonLabel }
        )
        .background(nextButtonBg)
        .clipShape(nextButtonClipShapeView)
        .contentShape(nextButtonClipShapeView)
    }
    
    private var nextButtonLabel: some View {
        Text("далее")
            .textCase(.uppercase)
            .font(.title)
            .bold()
            .padding()
            .foregroundStyle(Color.white)
            .frame(maxWidth: CGFloat.infinity)
    }
    
    private var nextButtonBg: some ShapeStyle {
        if state.nextButtonIsEnabled {
            Color.blue
        } else {
            Color.gray
        }
    }
    
    private var nextButtonClipShapeView: some Shape {
        RoundedRectangle(cornerRadius: 20)
    }
}

