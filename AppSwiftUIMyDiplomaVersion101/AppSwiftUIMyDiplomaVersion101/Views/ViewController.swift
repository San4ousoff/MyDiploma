//
//  ViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

// ViewController.swift

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Создаем экземпляр TabBarController
        let tabBarController = TabBarController()
        // Добавляем TabBarController как дочерний контроллер
        addChild(tabBarController)
        // Добавляем представление TabBarController в представление ViewController
        view.addSubview(tabBarController.view)
        // Завершаем добавление контроллера
        tabBarController.didMove(toParent: self)
    }
}
