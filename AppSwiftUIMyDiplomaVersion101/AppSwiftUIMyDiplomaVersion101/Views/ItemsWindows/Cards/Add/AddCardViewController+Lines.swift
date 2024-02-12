//
//  AddCardViewController+Lines.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 30.01.2024.
//

import UIKit

extension AddCardViewController {
    // TODO: доработать код - сделать более универсальным, убрать констрейнты из текущего класса
    func configure(_ line: UIView) {
        view.addSubview(line)
        
        line.backgroundColor = .lightGray

        // Устанавливаем ограничения для горизонтальной линии с отступами слева и справа
        line.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50), // Центрирование по вертикали
            line.heightAnchor.constraint(equalToConstant: 1), // Задаем высоту линии
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), // Начинается с отступом слева
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10) // Простирается с отступом справа
        ])
    }
}
