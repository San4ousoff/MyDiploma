//
//  CardListViewController+Scrolling.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 19.01.2024.
//

import UIKit

extension CardListViewController {
    /// Настройка прокрутки таблицы
    func scrollToBottomIfNeeded() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.cards.count - 1, section: 0)
            if self.tableView.indexPathsForVisibleRows?.contains(indexPath) == false {
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
}

