//
//  ExamContainer.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Combine
import SwiftUI

final class MVIContainer<Intent, Model>: ObservableObject {
    let intent: Intent
    let model: Model
    
    private var cancellable: Set<AnyCancellable> = []
    
    init(
        model: Model,
        intent: Intent,
        modelChangePublisher: ObjectWillChangePublisher
    ) {
        self.model = model
        self.intent = intent
        
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}
//
//final class ExamContainer: ObservableObject {
//    let model: ExamModelStateProtocol
//    let intent: ExamIntentProtocol
//    
//    private var cancellable: Set<AnyCancellable> = []
//    
//    init(
//        model: ExamModelStateProtocol,
//        intent: ExamIntentProtocol,
//        modelChangePublisher: ObjectWillChangePublisher
//    ) {
//        self.model = model
//        self.intent = intent
//        
//        modelChangePublisher
//            .receive(on: RunLoop.main)
//            .sink(receiveValue: objectWillChange.send)
//            .store(in: &cancellable)
//    }
//}
