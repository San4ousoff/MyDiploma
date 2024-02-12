//
//  DisplayCardEntityData.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 24.01.2024.
//

import CoreData

/* TODO: тестирование - получение данных из сущности в консоль
Применение:
let displayCardEntityData = DisplayCardEntityData(context: CoreDataStack.shared.context)
displayCardEntityData.checkContextContent()
**/
class DisplayCardEntityData {
    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    /// Метод для получения данных из сущности CardEntity
    func checkContextContent() {
        let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        do {
            let cards = try context.fetch(fetchRequest)
            if cards.isEmpty {
                print("Нет доступных записей в базе данных")
            } else {
                for card in cards {
                    if let cardID = card.id?.uuidString {
                        if let name = card.name, let imageData = card.image {
                            print("ID карты: \(cardID), Имя: \(name), Изображение: \(imageData.count) байт")
                        } else {
                            print("В некоторых данных карты отсутствует информация")
                        }
                    } else {
                        print("ID карты отсутствует")
                    }
                }
            }
        } catch {
            print("Ошибка извлечения карт из контекста: \(error)")
        }
    }
}
