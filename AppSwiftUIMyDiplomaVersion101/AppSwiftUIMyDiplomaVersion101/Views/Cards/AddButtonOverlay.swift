//
//  AddButtonOverlay.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 18.01.2024.
//

import UIKit

class AddButtonOverlay: UIView {
    let addButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var addButtonAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        addSubview(addButton)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

        // Настраиваем внешний вид кнопки
        let buttonSize: CGFloat = UIScreen.main.bounds.width / 6
        addButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        print("buttonSize =", buttonSize)
        // Делаем кнопку круглой
        addButton.layer.cornerRadius = buttonSize / 2
        
        // Добавим зеленый фон и символ "+"
        addButton.backgroundColor = UIColor.systemGreen
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
  
        if let superview = self.superview {
            // Настраиваем позиционирование кнопки относительно родительского вида
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                centerXAnchor.constraint(equalTo: superview.centerXAnchor),
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
        }
    }

    @objc private func addButtonTapped() {
        addButtonAction?()
    }
}










