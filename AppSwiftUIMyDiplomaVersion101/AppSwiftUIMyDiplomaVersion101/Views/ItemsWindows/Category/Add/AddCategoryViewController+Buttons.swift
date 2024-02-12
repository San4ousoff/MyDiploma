//
//  AddCategoryViewController+Buttons.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 30.01.2024.
//

import UIKit

extension AddCategoryViewController {
    /// Настройка кнопки добавления новой карты
    func configure(_ button: RoundButtonWithSettings) {
        button.addTarget(self, action: #selector(addNewCategoryButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        ConstraintsConstructor.setupViewConstraints(view: addNewCategoryButton, contentView: view, distanceFromYMultiplier: 0.4, distanceFromXMultiplier: 0)
    }
    
    /// Обработчик нажатия на кнопку добавления новой карты
    @objc func addNewCategoryButtonTapped() {
        if let categoryName = categoryNameTextField.text, let image = addImageForCategoryButton.imageView?.image, let _ = image.pngData() {
            categoryManager.addCategory(categoryName, image, 0) // Добавляем новую категорию через CategoryManager

            DispatchQueue.main.async {
                // После успешного добавления категории уведомляем об изменениях
                self.categoryManager.dataProvider.notifyObservers()
                self.dismiss(animated: true, completion: nil)
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
        
        button.setTitle("Добавить изображение", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 200), // Устанавливаем ширину кнопки
            button.heightAnchor.constraint(equalToConstant: 150) // Устанавливаем высоту кнопки
        ])
    }

    /// Обработчик нажатия на кнопку добавления изображения для новой категории
    @objc func addImageTapped() {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension AddCategoryViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    /// Обработка выбора изображения из галереи
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            addImageForCategoryButton.setTitle("", for: .normal)
            addImageForCategoryButton.setImage(pickedImage, for: .normal)
            addImageForCategoryButton.imageView?.contentMode = .scaleAspectFill // Устанавливаем контентное отображение изображения
        }

        dismiss(animated: true, completion: nil)
    }
}




