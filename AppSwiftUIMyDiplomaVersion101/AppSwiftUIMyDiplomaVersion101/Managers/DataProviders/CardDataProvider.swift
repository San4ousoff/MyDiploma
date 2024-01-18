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
    
    // Инициализация с передачей контекста CoreData
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getCards(completion: @escaping ([CardEntity]) -> Void) {
        var cards: [CardEntity] = []

        let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        do {
            cards = try CoreDataStack.shared.context.fetch(fetchRequest)
            completion(cards)
        } catch {
            print("Failed to fetch cards: \(error)")
            completion([])
        }
    }
    
    // Добавление карты в базу данных
    func addCard(_ id: Int, _ name: String, _ imageData: Data) {
        let newCard = CardEntity(context: self.context)
        newCard.id = Int16(id)
        newCard.name = name
        newCard.image = imageData

        do {
            try context.save()
        } catch {
            print("Ошибка сохранения данных: \(error)")
        }
    }
}

