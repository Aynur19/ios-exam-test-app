//
//  ExamIntent.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Foundation

final class ExamIntent: ObservableObject {
    private weak var model: ExamModelProtocol?
    
    init(model: ExamModelProtocol) {
        self.model = model
    }
    
}

extension ExamIntent: ExamIntentProtocol {
    func selectExam() {
        model?.select()
    }
}
