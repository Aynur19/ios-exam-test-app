//
//  ProgressBarView.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: CGFloat
    @State private var animationProgress: CGFloat = 0
    
    let barHeight: CGFloat = 20
    
    var body: some View {
        GeometryReader { geometry in    
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.blue.opacity(0.25))
                    .frame(height: barHeight)
                
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: animationProgress * geometry.size.width, height: barHeight)
                    .animation(.easeInOut(duration: 1.0), value: animationProgress)
            }
            .cornerRadius(barHeight / 2)
            .padding()
            .onAppear {
                animationProgress = progress
            }
            .onChange(of: progress) { newProgress in
                animationProgress = newProgress
            }
        }
        .frame(height: barHeight) // Устанавливаем фиксированную высоту для контейнера

    }
}
