//
//  ExamsListIntent.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Foundation

final class ExamsListIntent: ObservableObject {
    private weak var model: ExamsListModelProtocol?
    private let networService: NetworkServiceProtocol
    
    init(
        model: ExamsListModelProtocol,
        networService: NetworkServiceProtocol
    ) {
        self.model = model
        self.networService = networService
    }
}

extension ExamsListIntent: ExamsListIntentProtocol {
    func load() {
        Task { [weak self] in
            guard let self else {
                return
            }
            
            guard let dataModel = await networService.fetchExamsList() else {
                return
            }
            
            await MainActor.run { [weak self] in
                self?.model?.fill(dataModel: dataModel)
            }
                
        }
    }
    
    func selectExam(by id: Int) {
        model?.select(by: id)
    }
    
    func applySelection() {
        guard let model = model else { return }
        
        guard model.nextButtonIsEnabled else {
            model.showToast()
            return
        }
        
        guard model.listIsSelectable else {
            return
        }
        
        model.applySelection()
        let selectedExams = model.items.filter({ $0.isSelected })
        
        if selectedExams.isEmpty {
            print("Selected exams: ")
        } else {
            print("Selected exams: ")
            selectedExams.forEach { print("\t \($0.name)") }
        }
    }
}
