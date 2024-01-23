//
//  CardManager.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

// Реализация менеджера карт
import Foundation
import UIKit

class CardManager: CardManagerProtocol {
    let cardDataProvider: CardDataProvider

    init(cardDataProvider: CardDataProvider) {
        self.cardDataProvider = cardDataProvider
    }
        
    // Реализация операций добавления, редактирования и удаления карт
    // ...
    
    // Получение списка карт
    func getCards(completion: @escaping ([CardEntity]) -> Void) {
        cardDataProvider.getCards { cards in
            completion(cards)
        }
    }

    // Реализация метода добавления карты с конкретными данными (без View)
    // Метод добавления карты с поддержкой обратного вызова
    func addCard(_ name: String, _ imageData: Data, completion: @escaping () -> Void) {
            cardDataProvider.addCard(name, imageData) {
                // После успешного добавления вызываем обратный вызов
                completion()
            }
        }

    func editCard(_ card: CardEntity) {
        // ваша текущая реализация редактирования карт
    }

    func deleteCard(_ card: CardEntity) {
        // ваша текущая реализация удаления карт
    }
}
    // MARK: тестовые методы
    
    // Удаление всех карт из БД
//    func deleteAllCards() {
//        cardDataProvider.deleteAllCards()
//    }

  



