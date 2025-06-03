//
//  NotificationDispatcher.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Combine

@MainActor
public final class NotificationDispatcher {
    public static let shared = NotificationDispatcher()

    private init() {}

    private let toastSubject = PassthroughSubject<ToastModel, Never>()
    
    var toastPublisher: AnyPublisher<ToastModel, Never> {
        toastSubject.eraseToAnyPublisher()
    }
    
    func show(toast: ToastModel) {
        toastSubject.send(toast)
    }
    
    func showToast(message: String?) {
        guard let message, !message.isEmpty else { return }
        
        let toast = ToastModel(message: message)
        show(toast: toast)
    }
}

