//
//  AddCategoryViewController+TextFields.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 30.01.2024.
//

import UIKit

extension AddCategoryViewController {
    /// Настройка текстового поля для названия карты
    func configure(_ textField: UITextField) {
        view.addSubview(textField)
        textField.placeholder = "Название категории"
        textField.borderStyle = .roundedRect
        //textField.backgroundColor = UIColor.lightGray
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textAlignment = .left
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.delegate = self
        setupCustomConstraintsTextField()
    }
    
    /// Настройка констрейнтов для текстового поля
    func setupCustomConstraintsTextField() {
        ConstraintsConstructor.setupViewConstraints(view: categoryNameTextField, contentView: view, distanceFromYMultiplier: -0.3, distanceFromXMultiplier: 0)
        categoryNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        categoryNameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
     
}

// MARK: - UITextFieldDelegate
extension AddCategoryViewController: UITextFieldDelegate {
    
    /// Управление изменением текста в текстовом поле
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

