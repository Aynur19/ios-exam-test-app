//
//  NetworkService.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

final class NetworkService { }

extension NetworkService: NetworkServiceProtocol {
    func fetchExamsList() async -> ExamsListDataModel? {
        return ExamsListDataModel(
            items: [
                ExamDataModel(id: 1, name: "Математика"),
                ExamDataModel(id: 2, name: "Русский язык"),
                ExamDataModel(id: 3, name: "Физика"),
                ExamDataModel(id: 4, name: "Химия"),
                ExamDataModel(id: 5, name: "Биология"),
                ExamDataModel(id: 6, name: "Информатика и ИКТ"),
                ExamDataModel(id: 7, name: "История"),
                ExamDataModel(id: 8, name: "Обществознание"),
                ExamDataModel(id: 9, name: "География"),
                ExamDataModel(id: 10, name: "Литература")
            ]
        )
    }
}
