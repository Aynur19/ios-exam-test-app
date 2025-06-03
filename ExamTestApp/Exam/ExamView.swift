//
//  ExamView.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct ExamView {
    @StateObject private var container: MVIContainer<ExamIntentProtocol, ExamModelStateProtocol>

    init(model: ExamModel) {
        let intent = ExamIntent(model: model)
        let container = MVIContainer(
            model: model as ExamModelStateProtocol,
            intent: intent as ExamIntentProtocol,
            modelChangePublisher: model.objectWillChange
        )
        self._container = StateObject(wrappedValue: container)
    }
    
    private var intent: ExamIntentProtocol {
        container.intent
    }
    
    private var state: ExamModelStateProtocol {
        container.model
    }
}

extension ExamView: View {
    var body: some View {
        Text(state.name)
            .bold()
            .padding()
            .frame(maxWidth: CGFloat.infinity)
            .foregroundStyle(textColor)
            .background(backgroundColor.opacity(0.25))
            .clipShape(clipShapeView)
            .overlay {
                clipShapeView
                    .stroke(strokeColor, lineWidth: 2.0)
            }
            .contentShape(clipShapeView)
    }
    
    private var clipShapeView: some Shape {
        RoundedRectangle(cornerRadius: 12)
    }
    
    private var backgroundColor: some ShapeStyle {
        if state.isSelected {
            return Color.blue
        } else {
            return Color.gray
        }
    }
    
    private var strokeColor: some ShapeStyle {
        if state.isSelected {
            return Color.blue
        } else {
            return Color.gray
        }
    }
    
    private var textColor: some ShapeStyle {
        if state.isSelected {
            return Color.blue
        } else {
            return Color.black
        }
    }
}
