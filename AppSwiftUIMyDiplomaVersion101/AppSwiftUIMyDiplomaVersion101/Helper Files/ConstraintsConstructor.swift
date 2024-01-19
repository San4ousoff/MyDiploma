//
//  ConstraintsConstructor.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 15.01.2024.
//

import UIKit

class ConstraintsConstructor {
    static func setupButtonConstraints(button: UIButton, contentView: UIView) {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    static func setupButtonCellConstraints(button: UIButton, contentView: UIView) {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalTo: button.widthAnchor)
        ])
    }
    
    static func setupLabelCellConstraints(label: UILabel, button: UIButton, contentView: UIView) {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    /**
     Настройка констрейнтов для кнопки, размещаемой с учетом отступа от нижнего края представления.

     - Parameters:
        - button: Кнопка, для которой настраиваются констрейнты.
        - contentView: Представление, к которому добавляется кнопка.
        - distanceFromBottomMultiplier: Множитель, определяющий отступ кнопки от нижнего края представления. Значение 0.0 означает размещение у самого нижнего края, 1.0 - размещение у верхнего края представления.
     */
    static func setupRoundButtonConstraints(button: RoundButtonWithSettings, contentView: UIView, distanceFromBottomMultiplier: CGFloat) {
        // Отключаем автоматическую генерацию констрейнтов для кнопки
        button.translatesAutoresizingMaskIntoConstraints = false

        // Получаем Safe Area Layout Guide для учета безопасной области на различных устройствах и ориентациях
        let safeGuide = contentView.safeAreaLayoutGuide

        // Активация констрейнтов с использованием Safe Area для правильного позиционирования кнопки
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), // Центрирование кнопки по горизонтали
            button.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -safeGuide.layoutFrame.size.height * distanceFromBottomMultiplier) // Задание отступа от нижнего края с учетом Safe Area
        ])
    }


}
