//
//  main.swift
//  CommandLineVersion010
//
//  Created by Mac on 11.01.2024.
//

import Foundation

class Card: Hashable {
    let id: Int
    let name: String
    let icon: String

    init(id: Int, name: String, icon: String) {
        self.id = id
        self.name = name
        self.icon = icon
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct PlacePay: Hashable {
    let id: Int
    let name: String
    let icon: String
}

class CardManager {
    private var cashbackDictionary: [PlacePay: [Card: Double]] = [:]

    func addCard(_ card: Card, cashback: Double, for placePay: PlacePay) {
        var cashbackInfo = cashbackDictionary[placePay] ?? [:]
        cashbackInfo[card] = cashback
        cashbackDictionary[placePay] = cashbackInfo
    }

    func updateCashback(_ cashback: Double, for card: Card, placePay: PlacePay) {
        var cashbackInfo = cashbackDictionary[placePay] ?? [:]
        cashbackInfo[card] = cashback
        cashbackDictionary[placePay] = cashbackInfo
    }

    func findBestCard(for placePay: PlacePay) -> (Card, Double)? {
        guard let cashbackInfo = cashbackDictionary[placePay],
              let bestCard = cashbackInfo.max(by: { $0.value < $1.value }) else {
            return nil
        }
        return (bestCard.key, bestCard.value)
    }
}

let cardManager = CardManager()

let placePay1 = PlacePay(id: 1, name: "Ресторан", icon: "restaurant_icon")
let placePay2 = PlacePay(id: 2, name: "АЗС", icon: "gas_station_icon")
let placePay3 = PlacePay(id: 3, name: "Супермаркет", icon: "supermarket_icon")

let card1 = Card(id: 1, name: "Card1", icon: "card_icon1")
let card2 = Card(id: 2, name: "Card2", icon: "card_icon2")
let card3 = Card(id: 3, name: "Card3", icon: "card_icon3")

cardManager.addCard(card1, cashback: 5.0, for: placePay1)
cardManager.addCard(card1, cashback: 3.0, for: placePay2)
cardManager.addCard(card1, cashback: 1.0, for: placePay3)

cardManager.addCard(card2, cashback: 7.5, for: placePay1)
cardManager.addCard(card2, cashback: 2.5, for: placePay2)
cardManager.addCard(card2, cashback: 0.5, for: placePay3)

cardManager.addCard(card3, cashback: 3.0, for: placePay1)
cardManager.addCard(card3, cashback: 4.0, for: placePay2)
cardManager.addCard(card3, cashback: 2.0, for: placePay3)

print("*** Реализация выбора карты с макс процентом кэшбека с добавлением карты через метод. Применение структур, методов, классов. Вывод в консоль *** \n")
let selectedPlacePay = placePay2
if let (bestCard, maxCashback) = cardManager.findBestCard(for: selectedPlacePay) {
    print("Выбрана карточка \(bestCard.name) для места оплаты \(selectedPlacePay.name) с максимальным процентом кэшбека: \(maxCashback)%")
} else {
    print("Не удалось найти подходящую карточку для места оплаты \(selectedPlacePay.name)")
}



