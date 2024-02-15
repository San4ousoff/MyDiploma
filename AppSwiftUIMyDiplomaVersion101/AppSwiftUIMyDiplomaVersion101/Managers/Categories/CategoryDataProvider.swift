//
//  CategoryDataProvider.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 01.02.2024.
//

import CoreData
import UIKit

class CategoryDataProvider {
    
    weak var observer: CategoryDataProviderObserverProtocol?
    var observers: [CategoryDataProviderObserverProtocol] = []
    
    let context: NSManagedObjectContext
    var categories: [CategoryEntity] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.categories = []
    }
    
    func getCategories(completion: @escaping ([CategoryModel]) -> Void) {
            var categories: [CategoryEntity] = []
            // TODO: отладочный принт
            debugPrint("Метод CategoryDataProvider.getCategories запущен")

            let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
            do {
                // Получаем данные CategoryEntity из контекста
                categories = try context.fetch(fetchRequest)
                
                // Преобразовываем данные из CategoryEntity в CategoryModel
                let categoryModels: [CategoryModel] = categories.map { categoryEntity in
                    return convertCategoryEntityToModel(categoryEntity)
                }

                // TODO: отладочный принт
                debugPrint("Полученные категории из сущности:")
                for category in categoryModels {
                    debugPrint("ID: \(category.id)")
                    debugPrint("Name: \(category.name)")
                    debugPrint("MCC: \(category.mcc)")
                }

                completion(categoryModels)
            } catch {
                print("Ошибка передачи списка категорий (CategoryDataProvider.getCategories): \(error)")
                completion([])
            }
    }
    
    func addCategory(_ category: CategoryModel, completion: @escaping () -> Void) {
        let newCategory = CategoryEntity(context: context)
        newCategory.id = category.id
        newCategory.name = category.name
        newCategory.mcc = category.mcc
        let imageData = category.icon.pngData()
        newCategory.icon = imageData
        
        // TODO: отладочный принт
        debugPrint("Метод CategoryDataProvider.addCategory запущен")
        debugPrint("Добавляемая категория в сущность:")
        debugPrint("ID: \(newCategory.id ?? "N/A")")
        debugPrint("Name: \(newCategory.name ?? "N/A")")

        do {
            try context.save()
            completion()
            notifyObservers()
            debugPrint("updateData 1 CategoryDataProvider.notifyObservers")
        } catch {
            print("Ошибка добавления категории (CategoryDataProvider.addCategory): \(error)")
        }
    }
}
