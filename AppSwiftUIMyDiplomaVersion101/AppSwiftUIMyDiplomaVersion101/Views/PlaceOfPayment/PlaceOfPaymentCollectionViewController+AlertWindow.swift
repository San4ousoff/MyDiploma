//
//  PlaceOfPaymentCollectionViewController+AlertWindow.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 08.02.2024.
//

import UIKit

extension PlaceOfPaymentCollectionViewController {
    
    func showCardSelection(for cardsWithMaxCashback: [(CardModel, Double)], category: String) {
        let alertController = UIAlertController(title: "Выберите карту для оплаты для категории \(category)", message: nil, preferredStyle: .actionSheet)
        
        for (card, cashbackAmount) in cardsWithMaxCashback {
            alertController.addAction(UIAlertAction(title: "\(card.name) - \(cashbackAmount)%", style: .default, handler: { _ in
                self.showPaymentAlert(for: card, cashbackAmount: cashbackAmount)
            }))
        }
        
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }

    func showCardAlert(for category: CategoryModel) {
        let cardsWithMaxCashback = findCardsWithMaxCashback(forCategory: category)
        
        if cardsWithMaxCashback.count == 1 {
            showPaymentAlert(for: cardsWithMaxCashback[0].0, cashbackAmount: cardsWithMaxCashback[0].1)
        } else if cardsWithMaxCashback.count > 1 {
            showCardSelection(for: cardsWithMaxCashback, category: category.name)
        } else {
            let alertController = UIAlertController(title: "No Data", message: "No card data found for \(category.name)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showPaymentAlert(for card: CardModel, cashbackAmount: Double) {
        let alertController = UIAlertController(title: "Выбрана карта", message: "\(card.name) - Кэшбек: \(cashbackAmount)%", preferredStyle: .alert)
        
        let attributedMessage = NSMutableAttributedString(string: "\(card.name) - Кэшбек: \(cashbackAmount)%")
        attributedMessage.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)], range: NSRange(location: 0, length: card.name.count))
        
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        alertController.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Оплатить", style: .default, handler: { _ in
                PopupStub.showPopup(title: "Заглушка", message: "Здесь подразумевается реализация соединения приложения через API платежной системы с получением TID и MCC для формирования db Deal", viewController: self)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }

}


