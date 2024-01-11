//
//  main.swift
//  CommandLineVersion011
//
//  Created by Mac on 11.01.2024.
//

import Foundation

class Card {
    let id: Int
    let name: String
    let icon: String
    var variableProperties: [String: Any]
    
    init(id: Int, name: String, icon: String) {
        self.id = id
        self.name = name
        self.icon = icon
        self.variableProperties = [:]
    }
}

class CardBuilder {
    private var id: Int?
    private var name: String?
    private var icon: String?
    private var variableProperties: [String: Any] = [:]

    func setID(_ id: Int) -> CardBuilder {
        self.id = id
        return self
    }

    func setName(_ name: String) -> CardBuilder {
        self.name = name
        return self
    }

    func setIcon(_ icon: String) -> CardBuilder {
        self.icon = icon
        return self
    }

    func addVariableProperty(key: String, value: Any) -> CardBuilder {
        self.variableProperties[key] = value
        return self
    }

    func build() -> Card? {
        guard let id = id, let name = name, let icon = icon else {
            return nil
        }

        let card = Card(id: id, name: name, icon: icon)
        card.variableProperties = variableProperties
        return card
    }
}

print("*** Реализация и тестирование метода для создания карты (CardBuilder). Применение методов, классов. Вывод в консоль *** \n")
// Пример использования
let card = CardBuilder()
    .setID(1)
    .setName("Зарплатная")
    .setIcon("card_icon")
    .addVariableProperty(key: "monthlyCashback", value: ["Январь": 5.0, "Февраль": 7.0, "Март": 3.0])
    .addVariableProperty(key: "minimumPurchaseAmount", value: 1000.0)
    .build()

if let newCard = card {
    // Добавление созданной карты в базу данных или другую структуру хранения
    // newCard содержит экземпляр класса Card с указанными свойствами
    print("Добавлена новая карта: \(newCard.name)")
    print("ID карты: \(newCard.id)")
    print("Название карты: \(newCard.name)")
    print("Иконка карты: \(newCard.icon)")
    print("Дополнительные свойства карты: ")
    for (key, value) in newCard.variableProperties {
        print("\(key): \(value)")
    }
} else {
    print("Ошибка при создании карты")
}

