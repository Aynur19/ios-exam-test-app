//
//  ExamsListModel.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import Foundation

final class ExamsListModel: ObservableObject, ExamsListModelStateProtocol {
    @Published private(set) var listIsSelectable = true
    @Published private(set) var nextButtonIsEnabled = false
    @Published private(set) var toastIsShown = false
    @Published private(set) var progress: CGFloat = 0.0
    
    @Published private(set) var items: [ExamModel] = []
    
    init() { }
}

extension ExamsListModel: ExamsListModelActionsProtocol {
    func fill(dataModel: ExamsListDataModel) {
        self.items = dataModel.items
            .map { ExamModel(dataModel: $0) }
            .sorted { $0.id < $1.id }
    }
    
    func select(by id: Int) {
        guard  listIsSelectable else { return }
        
        if let idx = items.firstIndex(where: { $0.id == id }) {
            items[idx].select()
        }
        
        self.nextButtonIsEnabled = items.contains(where: { $0.isSelected })
    }
    
    func showToast() {
        if toastIsShown { return }
        
        toastIsShown = true
        let toast = ToastModel(
            message: "Выберите предмет",
            dismiss: { [weak self] in
                self?.toastIsShown = false
            }
        )
        NotificationDispatcher.shared.show(toast: toast)
    }
    
    func applySelection() {
        progress = 0.25
        listIsSelectable = false
    }
}
