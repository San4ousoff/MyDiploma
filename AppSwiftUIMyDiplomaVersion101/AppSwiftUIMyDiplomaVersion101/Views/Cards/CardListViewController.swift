//
//  CardListViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

class CardListViewController: UITableViewController {
    var cardManager: CardManagerProtocol
    var cards: [CardEntity] = []
    
    let customRoundButton = RoundButtonWithSettings(title: "+", backgroundColor: .systemBlue, titleColor: .white)

    init() {
        let context = CoreDataStack.shared.context
        let cardDataProvider = CardDataProvider(context: context)
        self.cardManager = CardManager(cardDataProvider: cardDataProvider)
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавление кнопки в качестве subview
        view.addSubview(customRoundButton)
        // Вызов констрейнтов для настройки расположения кнопки
        ConstraintsConstructor.setupRoundButtonConstraints(button: customRoundButton, contentView: view, distanceFromBottomMultiplier: 0.1)

        // Здесь регистрируется ячейка для UITableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CardCell")
        
        // TODO: реализовать добавление экземпляров карты не принудительно, это потом убрать
        let cardID = 1
        let cardName = "Тестовая карта"
        if let imageData = UIImage(named: "GB")?.pngData() {
            cardManager.addCard(cardID, cardName, imageData)
        } else {
            print("Ошибка: Невозможно конвертировать изображение в формат Data")
        }

        // Получение данных из CardManager через протокол
        cardManager.getCards { [weak self] fetchedCards in
            self?.cards = fetchedCards
            self?.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath)
        let card = cards[indexPath.row]

        // Настройка ячейки с данными из CardEntity
        cell.textLabel?.text = card.name
        
        if let cardImage = card.image {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50)) // Замените значения на ваши реальные размеры
            imageView.image = UIImage(data: cardImage)
            cell.accessoryView = imageView
        } else {
            // Handle case where card.image is nil
            // For example, show a placeholder image or default text
        }
        // Дополнительные настройки ячейки, например, изображения

        return cell
    }

}
