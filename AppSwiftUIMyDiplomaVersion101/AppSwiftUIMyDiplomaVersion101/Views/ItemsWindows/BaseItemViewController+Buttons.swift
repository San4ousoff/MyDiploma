//
//  BaseItemViewController+Buttons.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 30.01.2024.
//

import UIKit

extension BaseItemViewController {
    /// Настройка кнопки закрытия
    func setupCloseButton() {
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        view.addSubview(closeButton)
        ConstraintsConstructor.setupViewConstraints(view: closeButton, contentView: view, distanceFromYMultiplier: -0.42, distanceFromXMultiplier: 0.42)
    }
    
    /// Обработчик нажатия на кнопку закрытия
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
}
