//
//  AddCardViewController+Notifications.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 05.02.2024.
//

import UIKit

extension AddCardViewController {
    // Метод для отображения успешного добавления карты и кэшбеков
    func showSuccessAndCashbacks() {
            let successAndCashbacksAlert = UIAlertController(title: "Успешное добавление карты", message: "Имя карты: \(cardName ?? "")", preferredStyle: .alert)
            
            if !cashbacks.isEmpty {
                let cashbacksDescription = cashbacks.map { "Category: \($0.category), Percentage: \($0.percentage)%" }.joined(separator: "\n")
                successAndCashbacksAlert.message?.append("\n\nДобавленные кэшбеки:\n\(cashbacksDescription)")
            }
            
            successAndCashbacksAlert.addAction(UIAlertAction(title: "Добавить кэшбек", style: .default, handler: { [weak self] action in
                self?.showCashbackFormInCurrentContext()
            }))
            
            successAndCashbacksAlert.addAction(UIAlertAction(title: "Сохранить все кэшбеки", style: .default, handler: { [weak self] action in
                self?.saveAllCashbacks()
            }))
            
            present(successAndCashbacksAlert, animated: true, completion: nil)
        }

        func showCashbackFormInCurrentContext() {
            let cashbackForm = UIAlertController(title: "Добавить кэшбек", message: nil, preferredStyle: .alert)
            
            cashbackForm.addTextField { textField in
                textField.placeholder = "Процент"
                textField.keyboardType = .numbersAndPunctuation
            }
            cashbackForm.addTextField { textField in
                textField.placeholder = "Категория"
                textField.keyboardType = .default
            }
            
            cashbackForm.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [weak self] action in
                if let percentageText = cashbackForm.textFields?.first?.text,
                   let categoryText = cashbackForm.textFields?.last?.text,
                   let percentage = Double(percentageText) {
                    let newCashback = TestCashbackModel(category: categoryText, percentage: percentage)
                    self?.addCashback(newCashback)
                    self?.showSuccessAndCashbacks() // Обновляем окно с новым кэшбеком после добавления
                } else {
                    // Обработка неверных данных
                }
            }))
            
            cashbackForm.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            
            present(cashbackForm, animated: true, completion: nil)
        }

        func addCashback(_ cashback: TestCashbackModel) {
            cashbacks.append(cashback)
            //tableView.reloadData()
            // Проверяем, что методы вызываются после добавления данных
            print("Метод addCashback выполнен, reloadData вызван")
        }
        
    func saveAllCashbacks() {
        // Логика сохранения всех кэшбеков в базу данных

        // Выводим данные о кэшбеках в консоль
        print("Все кэшбеки:")
        for cashback in cashbacks {
            print("Category: \(cashback.category), Percentage: \(cashback.percentage)%")
        }

        // После сохранения всех кэшбеков в базу данных и добавления в массив,
        // обновляем данные в таблице для их отображения
//        DispatchQueue.main.async {
//            self.tableView.reloadData() // Обновляем данные в таблице
//            print("Таблица обновлена после сохранения кэшбеков")
//        }
        // Обновляем данные в таблице для их отображения
         tableView.reloadData()

         // После сохранения всех кэшбеков в базу данных и добавления в массив, таблица должна быть обновлена синхронно
         print("Таблица обновлена после сохранения кэшбеков")
     }
}
