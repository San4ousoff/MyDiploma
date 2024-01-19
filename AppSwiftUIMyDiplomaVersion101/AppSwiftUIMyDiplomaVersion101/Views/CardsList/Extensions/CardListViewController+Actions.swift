//
//  CardListViewController+Actions.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 19.01.2024.
//

import UIKit

extension CardListViewController {
    // Добавление обработчиков нажатия на кнопки и других действий
    // Например, методы для настройки интерфейса и обработчики пользователя

//     Настройка кнопки
    func setupCustomButton() {
        view.addSubview(customRoundButton)
        ConstraintsConstructor.setupRoundButtonConstraints(button: customRoundButton, contentView: view, distanceFromBottomMultiplier: 0.1)
        customRoundButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
    }
    
//     Обработка нажатия на кнопку
    @objc func customButtonTapped() {
        let cardID = 1
        let cardName = "Скроллинговая карта"
        if let imageData = UIImage(named: "GB")?.pngData() {
            cardManager.addCard(cardID, cardName, imageData) { [weak self] in
                DispatchQueue.main.async {
                    self?.updateCardData()
                    self?.scrollToBottomIfNeeded()
                }
            }
        } else {
            print("Ошибка: Невозможно конвертировать изображение в формат Data")
        }
    }
}
