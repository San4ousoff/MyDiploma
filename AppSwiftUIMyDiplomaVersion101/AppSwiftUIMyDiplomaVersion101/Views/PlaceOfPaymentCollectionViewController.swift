//
//  PlaceOfPaymentCollectionViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

import UIKit

private let reuseIdentifier = "Cell"

class PlaceOfPaymentCollectionViewController: UICollectionViewController {
    
    // TODO: Заменить в дальнейшем на рабочую модель с заполнением ее пользователем
    // Набор данных для отображения в ячейках
    private let categories: [CategoryModel] = [
        CategoryModel(name: "Еда", icon: "🍔"),
        CategoryModel(name: "Путешествия", icon: "✈️"),
        CategoryModel(name: "Спорт", icon: "⚽️"),
        CategoryModel(name: "Шоппинг", icon: "🛍"),
        CategoryModel(name: "Фильмы", icon: "🎬"),
        CategoryModel(name: "Музыка", icon: "🎵"),
        CategoryModel(name: "Игры", icon: "🎮"),
        CategoryModel(name: "Книги", icon: "📚"),
        CategoryModel(name: "Здоровье", icon: "⛹️‍♂️"),
        CategoryModel(name: "Техника", icon: "📱")
    ]
    
    // MARK: - Инициализация
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Наименование представления
        title = "Места оплаты"
        
        // Установка цвета фона коллекции
        collectionView.backgroundColor = .white
        
        // Регистрация ячейки для использования в коллекции
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
     }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.item]
        cell.configure(withIcon: category.icon, target: self, action: #selector(categoryButtonTapped(_:)))
        return cell
    }
    
    @objc func categoryButtonTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: collectionView)
        if collectionView.indexPathForItem(at: point) != nil {
            PopupStub.showPopup(title: "Лучшая карта", message: "Здесь будет реализация демонстрации логики выбора карты с макс кэшбеком", viewController: self)
        }
    }
    
    // TODO: Написать тесты для PlaceOfPaymentCollectionViewController
}

