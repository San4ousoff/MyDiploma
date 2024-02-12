//
//  AddCardViewController+Buttons.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 30.01.2024.
//

import UIKit

extension AddCardViewController {
    /// Настройка кнопки добавления новой карты
    func configure(_ button: RoundButtonWithSettings) {
        button.addTarget(self, action: #selector(addNewCardButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        ConstraintsConstructor.setupViewConstraints(view: addNewCardButton, contentView: view, distanceFromYMultiplier: 0.4, distanceFromXMultiplier: 0)
    }
    
    /// Обработчик нажатия на кнопку добавления новой карты
    @objc func addNewCardButtonTapped() {
        if let cardName = cardNameTextField.text, let imageData = addImageForCardButton.imageView?.image?.pngData() {
            cardManager.addCard(cardName, imageData) {
                DispatchQueue.main.async {
                    self.onCardAdded?()  // Вызываем замыкание после успешного добавления карты
                    self.showSuccessAndCashbacks()
                }
            }
        }
    }
    
    // TODO: доработать код - сделать более универсальным, убрать констрейнты из текущего класса
    /// Настройка кнопки добавления изображения для новой карты
    func configure(_ button: UIButton) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.mediaTypes = ["public.image"]

        view.addSubview(button)
        
        button.setTitle("Добавить\nизображение", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true // Позволяет тексту умещаться в границах кнопки
        button.titleLabel?.minimumScaleFactor = 0.5 // Минимальный масштаб текста
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            button.widthAnchor.constraint(equalToConstant: 100), // Устанавливаем ширину кнопки
            button.heightAnchor.constraint(equalToConstant: 75) // Устанавливаем высоту кнопки
        ])
    }

    /// Обработчик нажатия на кнопку добавления изображения для новой карты
    @objc func addImageTapped() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func configureAddCashback(_ button: UIButton) {
        view.addSubview(button)
        
        button.setTitle("Добавить кэшбек", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addCashbackTapped), for: .touchUpInside)

        ConstraintsConstructor.setupViewConstraints(view: addCashbackForCardButton, contentView: view, distanceFromYMultiplier: 0.3, distanceFromXMultiplier: 0)
    }
    
    @objc func addCashbackTapped() {
        PopupStub.showPopup(title: "Категории", message: "Здесь будет вызываться Список категорий и присваиваться % для кэшбека", viewController: self)
    }
    
}

extension AddCardViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    /// Обработка выбора изображения из галереи
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            addImageForCardButton.setTitle("", for: .normal)
            addImageForCardButton.setImage(pickedImage, for: .normal)
            addImageForCardButton.imageView?.contentMode = .scaleAspectFill // Устанавливаем контентное отображение изображения
        }

        dismiss(animated: true, completion: nil)
    }
}




