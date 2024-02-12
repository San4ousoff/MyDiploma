//
//  AddCategoryViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 22.01.2024.
//

// TODO: help (добавление своей картинки в симулятор) -
// xcrun simctl addmedia booted /путь/к/изображению/example.jpg

import UIKit

class AddCategoryViewController: BaseItemViewController {
    
    /// Текстовое поле для ввода названия карты
    let categoryNameTextField: UITextField = UITextField()
    
    /// Кнопка добавления карты в БД
    let addNewCategoryButton: RoundButtonWithSettings = RoundButtonWithSettings(title: "+", backgroundColor: .systemGreen, titleColor: .white)
    
    /// Кнопка добавления изображения карты в окно
    let addImageForCategoryButton: UIButton = UIButton()
    
    let imagePicker = UIImagePickerController()
        
    let categoryManager: CategoryManager

    init(categoryManager: CategoryManager) {
        self.categoryManager = categoryManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var onCategoryAdded: (() -> Void)?
    
    var categoryAddedClosure: (() -> Void)?
    
    // MARK: - методы
    /// Метод жизненного цикла, вызываемый после загрузки представления
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// Настройка UI элементов
    override func setupUI() {
        super.setupUI()
        self.titleLabel.text = "Новая категория"
        configure(categoryNameTextField)
        configure(addNewCategoryButton)
        configure(addImageForCategoryButton)
    }
       
}




