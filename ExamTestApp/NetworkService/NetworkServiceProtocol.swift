//
//  NetworkServiceProtocol.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

protocol NetworkServiceProtocol {
    func fetchExamsList() async -> ExamsListDataModel?
}
