//
//  ExamModelProtocol.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

typealias ExamModelProtocol = ExamModelStateProtocol & ExamModelActionsProtocol

@MainActor
protocol ExamModelStateProtocol: AnyObject {
    var id: Int { get }
    
    var name: String { get }
    
    var isSelected: Bool { get }
}

@MainActor
protocol ExamModelActionsProtocol: AnyObject {
    var exam: ExamDataModel { get }
    
    func select()
}
