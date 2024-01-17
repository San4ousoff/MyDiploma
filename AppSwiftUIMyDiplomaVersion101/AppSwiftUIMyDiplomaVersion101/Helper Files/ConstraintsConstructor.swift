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
}
