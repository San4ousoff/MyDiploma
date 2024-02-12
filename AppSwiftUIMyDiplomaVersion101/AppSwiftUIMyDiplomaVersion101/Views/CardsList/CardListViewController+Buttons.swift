//
//  CardListViewController+Buttons.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 19.01.2024.
//

import UIKit

extension CardListViewController {
    /// Настройка кнопки открытия окна для добавления карты
        func configure(_ button: RoundButtonWithSettings) {
            view.addSubview(button)

            button.translatesAutoresizingMaskIntoConstraints = false  // Убедимся, что констрейнты устанавливаются вручную
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            let bottomConstraint = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            bottomConstraint.priority = .defaultHigh  // Чтобы констрейнт имел приоритет над таблицей
            bottomConstraint.isActive = true

            button.addTarget(self, action: #selector(openAddCardWindowButtonTapped), for: .touchUpInside)
        }

    /// Обработчик нажатия на кнопку с открытием окна для добавления карты и обновлением списка карт после успешного добавления
    @objc func openAddCardWindowButtonTapped() {
        let addCardVC = AddCardViewController(cardManager: cardManager)
        addCardVC.onCardAdded = { [weak self] in
            self?.updateCardData()
            self?.scrollToBottomIfNeeded()
        }
        present(addCardVC, animated: true, completion: nil)
    }
}
