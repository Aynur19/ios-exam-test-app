//
//  ExamsListModelProtocol.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Foundation

typealias ExamsListModelProtocol = ExamsListModelStateProtocol & ExamsListModelActionsProtocol

@MainActor
protocol ExamsListModelStateProtocol: AnyObject {
    var items: [ExamModel] { get }
    
    var listIsSelectable: Bool { get }
    
    var nextButtonIsEnabled: Bool { get }
    
    var toastIsShown: Bool { get }
    
    var progress: CGFloat { get }
}

@MainActor
protocol ExamsListModelActionsProtocol: AnyObject {
    func fill(dataModel: ExamsListDataModel)
    
    func select(by id: Int)
    
    func showToast()
    
    func applySelection()
}
