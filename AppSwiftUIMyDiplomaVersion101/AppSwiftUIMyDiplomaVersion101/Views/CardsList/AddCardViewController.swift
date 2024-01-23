//
//  AddCardViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 22.01.2024.
//

import UIKit

class AddCardViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var cardNameTextField = UITextField()
    var selectImageButton = UIButton()
    var selectedImage: UIImage?
    var cardManager: CardManager!

    init(cardManager: CardManager) {
        self.cardManager = cardManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Настройка интерфейса для ввода наименования карты и выбора изображения
        cardNameTextField.placeholder = "Наименование карты"
        cardNameTextField.backgroundColor = .systemGray6
        cardNameTextField.layer.cornerRadius = 8

        selectImageButton.setTitle("Выбрать изображение", for: .normal)
        selectImageButton.addTarget(self, action: #selector(selectImageTapped), for: .touchUpInside)

        // Добавление текстового поля и кнопки на экран
        view.addSubview(cardNameTextField)
        view.addSubview(selectImageButton)

        // Настройка их layout с помощью NSLayoutConstraint или Auto Layout
    }

    // Обработка нажатия на кнопку выбора изображения
    @objc func selectImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    // Метод делегата UIImagePickerController для обработки выбора изображения
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = pickedImage
            // Опционально: обновление интерфейса для отображения выбранного изображения
        }

        dismiss(animated: true, completion: nil)
    }

    // Обработка нажатия на кнопку добавления карты
    @objc func addCardButtonTapped() {
        if let cardName = cardNameTextField.text, let imageData = selectedImage?.pngData() {
            cardManager.addCard(cardName, imageData) { [weak self] in
                DispatchQueue.main.async {
                    self?.dismiss(animated: true, completion: nil) // Закрытие экрана после добавления
                }
            }
        } else {
            print("Ошибка: Необходимо заполнить наименование и выбрать изображение для добавления карты")
        }
    }
}



