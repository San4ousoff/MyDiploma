//
//  CategoryListViewController+Buttons.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 19.01.2024.
//

import UIKit

extension CategoryListViewController {
    /// Настройка кнопки открытия окна для добавления категории
        func configure(_ button: RoundButtonWithSettings) {
            view.addSubview(button)

            button.translatesAutoresizingMaskIntoConstraints = false  // Убедимся, что констрейнты устанавливаются вручную
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            let bottomConstraint = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            bottomConstraint.priority = .defaultHigh  // Чтобы констрейнт имел приоритет над таблицей
            bottomConstraint.isActive = true

            button.addTarget(self, action: #selector(openAddCategoryWindowButtonTapped), for: .touchUpInside)
        }

    /// Обработчик нажатия на кнопку с открытием окна для добавления категории и обновлением списка категорий после успешного добавления
    @objc func openAddCategoryWindowButtonTapped() {
        let addCategoryVC = AddCategoryViewController(categoryManager: categoryManager)
        addCategoryVC.onCategoryAdded = { [weak self] in
            self?.updateData()
            self?.scrollToBottomIfNeeded()
        }
        present(addCategoryVC, animated: true, completion: nil)
    }


}
