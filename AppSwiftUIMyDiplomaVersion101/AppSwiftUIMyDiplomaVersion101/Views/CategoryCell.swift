//
//  CategoryCell.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

import UIKit

/// Ячейка коллекции для отображения категорий с кнопочным видом
class CategoryCell: UICollectionViewCell {
    
    // MARK: - Свойства
    
    /// Кнопка для отображения категории
    private let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Методы
    
    /// Настройка внешнего вида кнопки с указанной иконкой
    ///
    /// - Parameter icon: Иконка для отображения на кнопке
    func configure(withIcon icon: String, target: Any?, action: Selector) {
        button.setTitle(icon, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside) // добавляем обработчик нажатия
        contentView.addSubview(button)
        ConstraintsConstructor.setupButtonConstraints(button: button, contentView: contentView)
    }
}






