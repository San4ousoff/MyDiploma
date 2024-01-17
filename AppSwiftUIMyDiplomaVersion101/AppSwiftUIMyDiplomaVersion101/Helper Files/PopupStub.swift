//
//  PopupStub.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 15.01.2024.
//

import UIKit

/// Управляет отображением всплывающих окон
class PopupStub {
    
    /// Отображает всплывающее окно с заданным заголовком и сообщением
    ///
    /// - Parameters:
    ///   - title: Заголовок всплывающего окна
    ///   - message: Сообщение, отображаемое во всплывающем окне
    ///   - viewController: ViewController, на котором нужно отобразить всплывающее окно
    static func showPopup(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
