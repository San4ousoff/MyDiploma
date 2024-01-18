//
//  CardEntityDataTest.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

class CardEntityDataTest {
    static func createTestCard() -> CardEntity {
        let card = CardEntity()
        card.id = 1
        card.name = "Тестовая карта"
        if let testImage = UIImage(named: "test_image") {
            card.image = testImage.jpegData(compressionQuality: 0.8) // Преобразуйте изображение в Data
        }
        return card
    }

    static func createMultipleTestCards() -> [CardEntity] {
        var cards = [CardEntity]()

        let card1 = CardEntity()
        card1.id = 2
        card1.name = "Тестовая карта 1"
        if let testImage1 = UIImage(named: "test_image1") {
            card1.image = testImage1.jpegData(compressionQuality: 0.8) // Преобразуйте изображение в Data
        }

        let card2 = CardEntity()
        card2.id = 3
        card2.name = "Тестовая карта 2"
        if let testImage2 = UIImage(named: "test_image2") {
            card2.image = testImage2.jpegData(compressionQuality: 0.8) // Преобразуйте изображение в Data
        }

        cards.append(card1)
        cards.append(card2)

        return cards
    }
}

