//
//  ExamsListIntentProtocol.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

@MainActor
protocol ExamsListIntentProtocol {
    func load() async
    
    func selectExam(by id: Int)
    
    func applySelection()
}
