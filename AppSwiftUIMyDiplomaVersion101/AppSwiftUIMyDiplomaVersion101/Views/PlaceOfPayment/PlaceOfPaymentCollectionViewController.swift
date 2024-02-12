//
//  PlaceOfPaymentCollectionViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

import UIKit

class PlaceOfPaymentCollectionViewController: UICollectionViewController {

    // MARK: - Данные
    
    var uniqueCategories: [CategoryModel] = []
   
    internal let cards: [CardModel] = [
        CardModel(id: "1", name: "Зарплатная", image: UIImage(systemName: "😄") ?? UIImage()),
        CardModel(id: "2", name: "Дебетовая", image: UIImage(systemName: "😐") ?? UIImage()),
        CardModel(id: "3", name: "Кредитная", image: UIImage(systemName: "😢") ?? UIImage())
    ]
    
    internal let categories: [CategoryModel] = [
        CategoryModel(id: "1", name: "Кафе", icon: UIImage(systemName: "cup.and.saucer") ?? UIImage(), mcc: 0),
        CategoryModel(id: "2", name: "Кино", icon: UIImage(systemName: "film") ?? UIImage(), mcc: 0),
        CategoryModel(id: "3", name: "АЗС", icon: UIImage(systemName: "car") ?? UIImage(), mcc: 0),
        CategoryModel(id: "4", name: "Супермаркет", icon: UIImage(systemName: "cart.fill") ?? UIImage(), mcc: 0),
        CategoryModel(id: "5", name: "Авиабилеты", icon: UIImage(systemName: "airplane") ?? UIImage(), mcc: 0)
    ]
    
    internal var cashbacks: [CashbackModel] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.backgroundColor = .white
        title = "Места оплаты"
        
        setupData()
    }
    
    // MARK: - Обработка нажатия на кнопку категории

    // Метод обработчика нажатия на кнопку категории
    @objc func categoryButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        let location = button.convert(CGPoint.zero, to: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: location) else { return }
        
        let category = categories[indexPath.item]
        
        // Вызываем метод для отображения алерт-окна с изображением
        showCardAlert(for: category)
    }
}
    
extension PlaceOfPaymentCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 4  // Количество столбцов на экране
        let spacingBetweenCells: CGFloat = 10  // Расстояние между ячейками
        let width = (collectionView.bounds.width - spacingBetweenCells * (numberOfColumns - 1)) / numberOfColumns
        let height = width  // Ячейки квадратные
        return CGSize(width: width, height: height)
    }
}




