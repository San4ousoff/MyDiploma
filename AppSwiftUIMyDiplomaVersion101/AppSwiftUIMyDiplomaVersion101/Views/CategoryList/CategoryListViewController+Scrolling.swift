//
//  CategoryListViewController+Scrolling.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 19.01.2024.
//

import UIKit

extension CategoryListViewController {
    /// Настройка прокрутки таблицы
    func scrollToBottomIfNeeded() {
        DispatchQueue.main.async {
            let currentCategoriesCount = self.categories.count
            guard currentCategoriesCount > 0 else {
                return
            }
            
            let indexPath = IndexPath(row: currentCategoriesCount - 1, section: 0)
            if let visibleIndexPaths = self.tableView.indexPathsForVisibleRows, !visibleIndexPaths.contains(indexPath) {
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
}


