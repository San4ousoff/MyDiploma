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
        let iconFontSizePercentage: CGFloat = 0.5 // Процентная доля от ширины кнопки
        let labelFontSizePercentage: CGFloat = 0.05 // Процентная доля от ширины кнопки
        
        button.setTitle(icon, for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(button.bounds.width * iconFontSizePercentage)
        
        let label = UILabel()
        label.text = name
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = label.font.withSize(button.bounds.width * labelFontSizePercentage)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        ConstraintsConstructor.setupButtonCellConstraints(button: button, contentView: contentView)
        ConstraintsConstructor.setupLabelCellConstraints(label: label, button: button, contentView: contentView)
    }

}
