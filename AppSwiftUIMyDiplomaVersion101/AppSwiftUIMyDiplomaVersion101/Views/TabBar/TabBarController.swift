//
//  TabBarController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Инициализация и добавление вкладок
        
        // Инициализируем представление для отображения Мест оплаты
        let placeOfPaymentCollectionVC = PlaceOfPaymentCollectionViewController()
        placeOfPaymentCollectionVC.tabBarItem = UITabBarItem(title: "Место оплаты", image: UIImage(systemName: "heart"), tag: 0)

        // Инициализируем представление для отображения Списка карт
        let cardListViewController = CardListViewController()
        cardListViewController.tabBarItem = UITabBarItem(title: "Карты", image: UIImage(systemName: "creditcard"), tag: 1)
        
        // Инициализируем представление для отображения Списка категорий
        let categoryListViewController = CategoryListViewController()
        categoryListViewController.tabBarItem = UITabBarItem(title: "Категории", image: UIImage(systemName: "square.grid.2x2"), tag: 2)
               
        // Создаем UINavigationController для каждого представления
        let placeOfPaymentNavigationController = UINavigationController(rootViewController: placeOfPaymentCollectionVC)
        let cardNavigationController = UINavigationController(rootViewController: cardListViewController)
        let categoryNavigationController = UINavigationController(rootViewController: categoryListViewController)

        // Устанавливаем UINavigationController для каждого представления
        setViewControllers([placeOfPaymentNavigationController, cardNavigationController, categoryNavigationController], animated: false)
        
        // MARK: - Изменение порядка вкладок
        
        // Изменяем порядок вкладок на основе тега, чтобы Таб, запускающий placeOfPaymentCollectionVC, был в центре
        if var viewControllers = viewControllers, viewControllers.count > 1 {
            guard let placeOfPaymentIndex = viewControllers.firstIndex(where: { $0.tabBarItem.tag == 0 }),
                  placeOfPaymentIndex != 1 else {
                return
            }
            
            let placeOfPaymentVC = viewControllers.remove(at: placeOfPaymentIndex)
            viewControllers.insert(placeOfPaymentVC, at: 1)
            setViewControllers(viewControllers, animated: false)
        }
    }
    
    // MARK: - Вызов анимации таб-бара
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Анимация выезжания из левой стороны к таб-бару
        self.tabBar.slideInFromLeft(duration: 1)
    }
}





