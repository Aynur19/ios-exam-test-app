//
//  ContentView.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct ContentView: View {
//    @State private var toast: ToastModel?
//    
//    init() {
//        NotificationDispatcher.shared.toastPublisher
//            .receive(on: DispatchQueue.main)
//            .sink { toast in
//                self.toast = toast
//            }
//            .store(in: &cancellables)
//    }
//    
    var body: some View {
        ExamsListView(networService: NetworkService())
            
//        ExamView(
//            dataModel: ExamDataModel(
//                id: 1,
//                name: "Русский язык")
//        )
    }
}

#Preview {
    ContentView()
}
