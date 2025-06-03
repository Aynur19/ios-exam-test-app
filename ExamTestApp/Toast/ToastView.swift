//
//  ToastView.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct ToastView: View {
    let toast: ToastModel
    let dismiss: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            labelView
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 20)
                .padding(.top, 60)
                
                Spacer()
        }
    }
    
    private var labelView: some View {
        Text(toast.message)
            .bold()
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.center)
    }
}
