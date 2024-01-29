//
//  AddCardViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 22.01.2024.
//

import UIKit

class AddCardViewController: BaseItemViewController {
    
    lazy var cardNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название карты"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textAlignment = .left
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.delegate = self
        return textField
    }()
    
    lazy var addCustomRoundButton: RoundButtonWithSettings = {
        let button = RoundButtonWithSettings(title: "+", backgroundColor: .systemGreen, titleColor: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "Новая карта"
        view.addSubview(cardNameTextField)
        setupCustomConstraints()
    }
    
    @objc func addButtonTapped() {
        print("Закрыто окно Добавления")
        dismiss(animated: true, completion: nil)
    }
    
    func setupCustomConstraints() {
        ConstraintsConstructor.setupViewConstraints(view: cardNameTextField, contentView: view, distanceFromYMultiplier: -0.3, distanceFromXMultiplier: 0)
        cardNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        cardNameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true

        view.addSubview(addCustomRoundButton)
      
        ConstraintsConstructor.setupViewConstraints(view: addCustomRoundButton, contentView: view, distanceFromYMultiplier: 0.35, distanceFromXMultiplier: 0)
    }
}

// Оставляем метод делегата UITextField без изменений
extension AddCardViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

