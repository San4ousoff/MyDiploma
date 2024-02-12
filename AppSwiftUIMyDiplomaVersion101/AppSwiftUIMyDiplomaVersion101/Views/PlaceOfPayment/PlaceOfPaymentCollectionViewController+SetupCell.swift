//
//  PlaceOfPaymentCollectionViewController+SetupCell.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 08.02.2024.
//

import UIKit

extension PlaceOfPaymentCollectionViewController {
    
    func configureCell(cell: CategoryCell, icon: UIImage, name: String) {
        cell.iconImageView.image = icon
        cell.nameLabel.text = name
    }
    
    // MARK: - UICollectionViewDataSource

    /// Определяет количество элементов в указанной секции коллекции
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return uniqueCategories.count // Используем количество кэшбеков как количество ячеек
    }

    /// Создает или переиспользует ячейку коллекции для определенного индекса пути и заполняет ее содержимым
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        // Убедимся, что у нас есть корректные данные категории и кэшбека для соответствующего индекса
        let cashback = cashbacks[indexPath.item]
        guard let correspondingCategory = categories.first(where: { $0.id == cashback.categoryID }) else {
            return cell // Вернуть пустую ячейку, если категория не найдена
        }
        
        // Явно вызываем метод configureCell для настройки содержимого ячейки
        configureCell(cell: cell, icon: correspondingCategory.icon, name: correspondingCategory.name)
        
        // Вешаем обработчик нажатия на кнопку категории
        cell.button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
}
