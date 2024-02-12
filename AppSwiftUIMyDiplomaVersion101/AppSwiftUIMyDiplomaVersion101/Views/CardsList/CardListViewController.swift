//
//  CardListViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

class CardListViewController: UITableViewController {
    var cards: [CardEntity] = []
    
    lazy var cardManager: CardManager = {
            let context = CoreDataStack.shared.context
            let cardDataProvider = CardDataProvider(context: context)
            return CardManager(cardDataProvider: cardDataProvider)
        }()
    
    let openAddCardWindowButton = RoundButtonWithSettings(title: "+", backgroundColor: .systemBlue, titleColor: .white)

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список карт"
        self.tabBarItem.title = "Карты"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CardCell")
        updateCardData()
        configure(openAddCardWindowButton)

        let buttonHeight: CGFloat = openAddCardWindowButton.frame.size.height
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: buttonHeight, right: 0)
        tableView.contentInset = inset
        tableView.scrollIndicatorInsets = inset
    }
    
    // Обновление данных карт
    internal func updateCardData() {
        cardManager.getCards { [weak self] fetchedCards in
            self?.cards = fetchedCards
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                // debugPrint("Успешно получено (CardListViewController) \(self?.cards.count ?? 0) из БД")
            }
        }
    }
    
    // MARK: - настройки таблицы

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
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50)) 
            imageView.image = UIImage(data: cardImage)
            cell.accessoryView = imageView
        } else {
            // Если отсутствует изображение карты, показываем системную иконку "questionmark.circle"
            let systemImageName = "questionmark.circle"
            cell.imageView?.image = UIImage(systemName: systemImageName)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCard = cards[indexPath.row]
        let message = "Выбрана карта: \(selectedCard.name ?? "*** без имени ***")"
        PopupStub.showPopup(title: "Заглушка", message: message, viewController: self)
    }
}
