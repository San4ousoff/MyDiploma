//
//  CategoryCell.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // Инициализация кнопки
    let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 75) // Установка шрифта кнопки
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialization
    
    // Инициализация ячейки
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button) // Добавление кнопки на представление ячейки
    }
    
    // Инициализация из storyboard или xib
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(button) // Добавление кнопки на представление ячейки
    }
    
    // MARK: - Configuration
    
    // Метод для настройки ячейки с иконкой и названием
    ///
    /// - Parameters:
    ///   - icon: Иконка для отображения на кнопке
    ///   - name: Текст для отображения под кнопкой
    func configure(withIcon icon: String, name: String) {
        button.setTitle(icon, for: .normal) // Установка изображения для кнопки
        button.titleLabel?.numberOfLines = 2 // Многострочный текст
        button.titleLabel?.textAlignment = .center // Выравнивание текста
        button.titleLabel?.adjustsFontSizeToFitWidth = true // Масштабирует текст для подгонки по ширине
        button.titleLabel?.minimumScaleFactor = 0.5 // Минимальный масштаб текста
        button.setTitleColor(.black, for: .normal) // Цвет текста
        
        let label = UILabel() // Инициализация метки
        label.text = name // Установка текста метки
        label.numberOfLines = 2 // Многострочный текст
        label.textAlignment = .center // Выравнивание текста
        label.font = UIFont.systemFont(ofSize: 12) // Установка шрифта метки
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label) // Добавление метки на представление ячейки
        
        ConstraintsConstructor.setupButtonCellConstraints(button: button, contentView: contentView) // Установка констрейнтов для кнопки
        ConstraintsConstructor.setupLabelCellConstraints(label: label, button: button, contentView: contentView) // Установка констрейнтов для метки
    }
}
