//
//  version001.swift
//  
//
//  Created by Mac on 11.01.2024.
//

import Foundation

struct PlacePay: Equatable {
    let id: Int
    let name: String
    let icon: String
    
    static func ==(lhs: PlacePay, rhs: PlacePay) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.icon == rhs.icon
    }
}

struct Card {
    let id: Int
    let name: String
    let placePay: [PlacePay]
    let cashbackPercentage: Double
    let icon: String
}

func findBestCard(for placePay: PlacePay, from cards: [Card]) -> Card? {
    var bestCard: Card?
    var maxCashbackPercentage: Double = 0
    
    for card in cards {
        if card.placePay.contains(placePay) && card.cashbackPercentage > maxCashbackPercentage {
            maxCashbackPercentage = card.cashbackPercentage
            bestCard = card
        }
    }
    
    return bestCard
}

let placePay = PlacePay(id: 1, name: "Ресторан", icon: "restaurant_icon")
let placePay = PlacePay(id: 2, name: "Супермаркет", icon: "restaurant_icon")

let cards = [
    Card(id: 1, name: "Card1", placePay: [placePay], cashbackPercentage: 5.0, icon: "card_icon1"),
    Card(id: 2, name: "Card2", placePay: [placePay], cashbackPercentage: 7.5, icon: "card_icon2"),
    Card(id: 3, name: "Card3", placePay: [placePay], cashbackPercentage: 3.0, icon: "card_icon3")
]

if let bestCard = findBestCard(for: placePay, from: cards) {
    print("Выбрана карточка \(bestCard.name) с процентом кэшбека \(bestCard.cashbackPercentage)%")
} else {
    print("Не удалось найти подходящую карточку для данного места оплаты")
}
