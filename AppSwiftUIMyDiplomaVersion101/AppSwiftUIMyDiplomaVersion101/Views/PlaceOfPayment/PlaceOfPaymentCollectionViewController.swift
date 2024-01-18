//
//  PlaceOfPaymentCollectionViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

import UIKit

class PlaceOfPaymentCollectionViewController: UICollectionViewController {

    // MARK: - Данные
    
    // Массив категорий товаров
    // TODO: Заменить этот массив на данные, из модели, которую заполняет пользователь
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
    
    // MARK: - Жизненный цикл
    
    /// Инициализация контроллера
    ///
    /// - Note: А также настройка вида коллекции, регистрация ячейки и установка фона.
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 0.25 * UIScreen.main.bounds.width / 4
        let itemSize = (UIScreen.main.bounds.width - 2 * spacing) / 4 - spacing
        layout.itemSize = CGSize(width: itemSize, height: itemSize + 30) // Высота кнопки + подпись
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.backgroundColor = .white
        title = "Места оплаты"
    }

    // MARK: - UICollectionViewDataSource

    /// Определяет количество элементов в указанной секции коллекции
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    /// Создает или переиспользует ячейку коллекции для определенного индекса пути и заполняет ее содержимым
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.item]
        cell.configure(withIcon: category.icon, name: category.name) // Настройка ячейки с данными категории
        cell.button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside) // Добавляем действие при нажатии на кнопку
        return cell
    }

    // MARK: - Обработка нажатия на кнопку категории

    @objc func categoryButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? CategoryCell else { return }  // Находим соответствующую ячейку
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let category = categories[indexPath.item]
        PopupStub.showPopup(title: "Лучшая карта", message: "Здесь будет реализация демонстрации логики выбора карты с макс кэшбеком для категории \(category.name)", viewController: self)
    }
    
    // MARK: - TODO
    
    // TODO: Написать тесты для PlaceOfPaymentCollectionViewController
}


