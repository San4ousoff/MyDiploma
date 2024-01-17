//
//  UITabBar+PulseAnimation.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

/// Расширение для добавления анимации встроенному типу UITabBar
extension UITabBar {
    
    // MARK: - Анимация выезжания таб-бара из левой стороны
    
    func slideInFromLeft(duration: TimeInterval) {
        // Сохранение текущего центра и трансформации таб-бара
        let originalCenter = center
        let originalTransform = transform
        let screenWidth = UIScreen.main.bounds.width

        // Смещение таб-бара за пределы экрана слева
        transform = CGAffineTransform(translationX: -screenWidth, y: 0)
        isHidden = false

        // Анимация возврата таб-бара на место
        UIView.animate(withDuration: duration, animations: {
            self.transform = originalTransform
        }) { _ in
            self.transform = originalTransform
            self.center = originalCenter
        }
    }
}



