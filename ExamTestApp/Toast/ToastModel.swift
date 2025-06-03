//
//  ToastModel.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct ToastModel: Identifiable {
    let id: UUID
    let message: String
    let duration: Double
    let transition: AnyTransition
    let dismiss: () -> Void
    
    init(
        id: UUID = .init(),
        message: String,
        duration: Double = 2,
        transition: AnyTransition = AnyTransition.move(edge: .top),
        dismiss: @escaping () -> Void = { }
    ) {
        self.id = id
        self.message = message
        self.duration = duration
        self.transition = transition
        self.dismiss = dismiss
    }
}

extension ToastModel: Equatable {
    static func == (lhs: ToastModel, rhs: ToastModel) -> Bool {
        lhs.id == rhs.id
    }
}
