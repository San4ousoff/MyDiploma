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
        ConstraintsConstructor.setupViewConstraints(view: customRoundButton, contentView: self.view, distanceFromYMultiplier: 0.0, distanceFromXMultiplier: 0.0)
        customRoundButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
    }
    
    // Обработка нажатия на кнопку
    @objc func customButtonTapped() {
        // Создание экземпляра AddCardViewController
        let addCardVC = AddCardViewController()
        // Отображение AddCardViewController
        present(addCardVC, animated: true, completion: nil)
    }

//    @objc func customButtonTapped() {
//        // TODO: здесь нам предстоит вызвать вью, который добавляет данные по карте после взаимодействия с пользователем
//        let cardName = "Новая карта"
//        if let imageData = UIImage(named: "GB")?.pngData() {
//            cardManager.addCard(cardName, imageData) { [weak self] in
//                DispatchQueue.main.async {
//                    self?.updateCardData()
//                    self?.scrollToBottomIfNeeded()
//                }
//            }
//        } else {
//            print("Ошибка: Невозможно конвертировать изображение в формат Data")
//        }
//    }
}
