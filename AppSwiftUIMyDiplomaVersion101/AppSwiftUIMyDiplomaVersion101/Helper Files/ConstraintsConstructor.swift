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
    
    static func setupViewConstraints(view: UIView, contentView: UIView, distanceFromYMultiplier: CGFloat, distanceFromXMultiplier: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false // Отключаем автоматическую генерацию констрейнтов для вида
        //let safeGuide = contentView.safeAreaLayoutGuide // Получаем Safe Area Layout Guide
        let centerY = contentView.centerYAnchor // Центрирование по вертикали
        let centerX = contentView.centerXAnchor // Центрирование по горизонтали
        
        NSLayoutConstraint.activate([
            // Устанавливаем констрейнты с использованием Safe Area для правильного позиционирования вида
            view.centerYAnchor.constraint(equalTo: centerY, constant: contentView.bounds.height * distanceFromYMultiplier), // Размещение вида относительно центра по вертикали
            view.centerXAnchor.constraint(equalTo: centerX, constant: contentView.bounds.width * distanceFromXMultiplier), // Размещение вида относительно центра по горизонтали
        ])
    }



}
