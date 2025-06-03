//
//  ToastModifier.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var toast: ToastModel?
    @State private var workItem: DispatchWorkItem?
    
    init(toast: Binding<ToastModel?>) {
        _toast = toast
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 17, *) {
            contentAfter_iOS17(content)
        } else {
            contentBefore_iOS17(content)
        }
    }
    
    @available(iOS 17, *)
    private func contentAfter_iOS17(_ content: Content) -> some View {
        content
            .overlay { toastView }
            .onChange(of: toast) { oldValue, newValue in
                showToast()
            }
    }
    
    private func contentBefore_iOS17(_ content: Content) -> some View {
        content
            .overlay { toastView }
            .onChange(of: toast) { value in
                showToast()
            }
    }
    
    private var toastView: some View {
        ZStack {
            if let toast = toast {
                VStack {
                    Spacer()
                    ToastView(toast: toast) { }
                }
                .transition(toast.transition)
            }
        }
        .animation(.easeInOut(duration: 1), value: toast)
    }
    
    private func showToast() {
        guard let toast = toast else { return }
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
                dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(
                deadline: .now() + toast.duration,
                execute: task
            )
        }
    }
    
    private func dismissToast() {
        let dismiss = toast?.dismiss
        
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            dismiss?()
        }
    }
}

extension View {
    func toastView(toast: Binding<ToastModel?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}

