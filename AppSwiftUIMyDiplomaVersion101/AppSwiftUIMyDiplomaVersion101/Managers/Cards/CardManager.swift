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
    
    /// Метод получения списка карт
    func getCards(completion: @escaping ([CardEntity]) -> Void) {
        cardDataProvider.getCards { cards in
            completion(cards)
        }
    }

    /// Метод добавления карты
    func addCard(_ name: String, _ imageData: Data, completion: @escaping () -> Void) {
        cardDataProvider.addCard(name, imageData) {
            // После успешного добавления вызываем обратный вызов
            completion()
        }
    }

    /// Метод редактирования карты
    func editCard(_ card: CardEntity) {
        // ваша текущая реализация редактирования карт
    }

    /// Метод удаления карты
    func deleteCard(_ card: CardEntity) {
        // ваша текущая реализация удаления карт
    }
}

  



