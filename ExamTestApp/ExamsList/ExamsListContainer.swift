//
//  ExamsListContainer.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Combine
import SwiftUI

@MainActor
final class ExamsListContainer: ObservableObject {
    @Published var toast: ToastModel?
    
    let intent: ExamsListIntentProtocol
    let model: ExamsListModelStateProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(
        model: ExamsListModelStateProtocol,
        intent: ExamsListIntentProtocol,
        modelChangePublisher: ObjectWillChangePublisher
    ) {
        self.model = model
        self.intent = intent
        
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellables)
        
        NotificationDispatcher.shared.toastPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] toast in
                self?.toast = toast
            }
            .store(in: &cancellables)
    }
}
