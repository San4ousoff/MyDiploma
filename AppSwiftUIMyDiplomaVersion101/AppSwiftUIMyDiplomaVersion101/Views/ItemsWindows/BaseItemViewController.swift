//
//  BaseItemViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 27.01.2024.
//

import UIKit

/// Родительский класс, представляющий базовый контроллер элемента
class BaseItemViewController: UIViewController {
    
    /// Лейбл для отображения заголовка элемента
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    /// Кнопка закрытия элемента
    let closeButton: RoundButtonWithSettings = {
        let button = RoundButtonWithSettings(title: "X", backgroundColor: .white, titleColor: .gray)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    /// Настройка UI элементов
    func setupUI() {
        view.addSubview(titleLabel)
        ConstraintsConstructor.setupViewConstraints(view: titleLabel, contentView: view, distanceFromYMultiplier: -0.4, distanceFromXMultiplier: 0)
        
        setupCloseButton()
    }
    
}







