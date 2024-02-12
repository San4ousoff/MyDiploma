//
//  RoundButtonWithSettings.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 19.01.2024.
//

import UIKit

/// Отображает круглую настраиваемую кнопку
///
/// - Parameters:
///   - title: Название (один символ) на кнопке
///   - backgroundColor: Цвет кнопки
///   - titleColor: Цвет шрифта
class RoundButtonWithSettings: UIButton {
    init(title: String, backgroundColor: UIColor, titleColor: UIColor) {
        super.init(frame: .zero)
        
        // Настройка внешнего вида кнопки
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        setTitleColor(titleColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        //self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
    
}




