//
//  ExamModel.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Foundation

final class ExamModel: ObservableObject, Identifiable, ExamModelStateProtocol {
    let id: Int
    let name: String
    @Published private(set) var isSelected: Bool
    
    init(dataModel: ExamDataModel) {
        self.id = dataModel.id
        self.name = dataModel.name
        self.isSelected = false
    }
    
    init(
        id: Int,
        name: String,
        isSelected: Bool
    ) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}

extension ExamModel: ExamModelActionsProtocol {
    var exam: ExamDataModel {
        ExamDataModel(id: id, name: name)
    }
    
    func select() {
        isSelected.toggle()
    }
}
