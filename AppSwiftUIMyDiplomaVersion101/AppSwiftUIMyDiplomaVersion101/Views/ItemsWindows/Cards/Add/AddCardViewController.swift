//
//  AddCardViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 22.01.2024.
//

// TODO: help (добавление своей картинки в симулятор) -
// xcrun simctl addmedia booted /путь/к/изображению/example.jpg

import UIKit

class AddCardViewController: BaseItemViewController, UITableViewDelegate, UITableViewDataSource {
    //TODO: временные переменные для упрощенной реализации
    var cardName: String?
    var cashbacks: [TestCashbackModel] = []
    
    /// Текстовое поле для ввода названия карты
    let cardNameTextField: UITextField = UITextField()
    
    /// Кнопка добавления карты в БД
    let addNewCardButton: RoundButtonWithSettings = RoundButtonWithSettings(title: "+", backgroundColor: .systemGreen, titleColor: .white)
    
    /// Разделительная линия
    let separatorLine: UIView = UIView()
    
    /// Кнопка добавления изображения карты в окно
    let addImageForCardButton: UIButton = UIButton()
    
    /// Кнопка добавления кэшбека в карту
    let addCashbackForCardButton: UIButton = UIButton()
    
    /// Таблица для отображения кэшбеков на карте
    let tableView: UITableView = UITableView()
    
    let imagePicker = UIImagePickerController()
        
    let cardManager: CardManager

    init(cardManager: CardManager) {
        self.cardManager = cardManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var onCardAdded: (() -> Void)?
    
    // MARK: - методы
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }
    
    /// Настройка UI элементов
    override func setupUI() {
        super.setupUI()
        self.titleLabel.text = "Новая карта"
        configure(cardNameTextField)
        configure(addNewCardButton)
        //configure(separatorLine)
        configure(addImageForCardButton)
        configureAddCashback(addCashbackForCardButton)
        setupTableView(belowLine: addImageForCardButton)
    }
    
}




