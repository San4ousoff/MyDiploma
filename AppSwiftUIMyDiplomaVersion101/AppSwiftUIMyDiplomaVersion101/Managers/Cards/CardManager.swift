//
//  CardManager.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import Foundation
import UIKit

// Реализация менеджера карт
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
            completion()
        }
    }

    /// Метод редактирования карты
    func editCard(_ card: CardEntity) {
    }

    /// Метод удаления карты
    func deleteCard(_ card: CardEntity) {
    }
}

  



