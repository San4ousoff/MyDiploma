//
//  CardDataProvider.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import Foundation
import CoreData

class CardDataProvider {
    
    let context: NSManagedObjectContext  // Контекст CoreData
    var cards: [CardEntity] = []
    
    // Инициализация с передачей контекста CoreData
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getCards(completion: @escaping ([CardEntity]) -> Void) {
        var cards: [CardEntity] = []

        let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        do {
            cards = try CoreDataStack.shared.context.fetch(fetchRequest)
            print("Успешно получено (CardDataProvider.getCards) \(cards.count) из БД")
//      ID с UUID работает - присваивается значение
//            for card in cards {
//                print("Card ID: \(String(describing: card.id))")
//            }

            completion(cards)
        } catch {
            print("Ошибка передачи списка карт (getCards): \(error)")
            completion([])
        }
    }
    
    func addCard(_ name: String, _ imageData: Data, completion: @escaping () -> Void) {
        // print("Попытка вызова метода...") // Отладочный вывод для отслеживания вызова метода
        let newCard = CardEntity(context: context)
        newCard.id = UUID()
        
        if !name.isEmpty {
               newCard.name = name
           } else {
               print("Внимание: Пустое имя для карточки")
           }

        if !imageData.isEmpty {
               newCard.image = imageData
           } else {
               print("Внимание: Отсутствует картинка")
           }


        do {
            try context.save()
            // Получаем обновленный список карт после успешного добавления
            getCards { cards in
                self.cards = cards // Обновляем локальный массив cards
                // print("Карта успешно добавлена! Количество записей в cardEntity: \(self.cards.count)") // Отладочный вывод для отслеживания успешного добавления
                completion() // Вызываем completion в конце, чтобы уведомить об успешном добавлении
            }

        } catch {
            print("Ошибка добавления карты (addCard): \(error)") // Отладочный вывод для отслеживания ошибок
        }
    }
}
    
    // TODO: для тестирования - удаление всех карт в БД
//    func deleteAllCards() {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CardEntity")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//        do {
//            try CoreDataStack.shared.context.execute(deleteRequest)
//            try CoreDataStack.shared.context.save()
//        } catch {
//            print("Ошибка удаления всех карт (deleteAllCards):: \(error)")
//        }
//    }


