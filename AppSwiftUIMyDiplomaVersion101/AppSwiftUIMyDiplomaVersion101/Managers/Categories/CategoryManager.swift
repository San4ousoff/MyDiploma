//
//  CategoryManager.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 01.02.2024.
//

import UIKit
import CoreData

// Реализация менеджера категорий
class CategoryManager: CategoryManagerProtocol {
    
    var categories: [CategoryModel] = []
    
    lazy var dataProvider: CategoryDataProvider = {
        let coreDataStack = CoreDataStack.shared // Предположим, что у вас есть CoreDataStack
        let categoryDataProvider = CategoryDataProvider(context: coreDataStack.context)
        return categoryDataProvider
    }()
    
    /// Метод получения списка категорий
    func getCategories(completion: @escaping ([CategoryModel]) -> Void) {
        // TODO: отладочный принт
//        let trace = Thread.callStackSymbols.joined(separator: "\n")
//        debugPrint("Метод CategoryManager.getCategories запущен with stack trace:\n\(trace)")

        dataProvider.getCategories(completion: completion)
    }
    
    /// Метод добавления категории
    func addCategory(_ name: String, _ icon: UIImage, _ mcc: Int16) {
        let newCategory = CategoryModel(id: UUID().uuidString, name: name, icon: icon, mcc: mcc)
        categories.append(newCategory)
        
        // TODO: отладочный принт
        debugPrint("Метод CategoryManager.addCategory запущен")
        debugPrint("Добавляемая категория в массив:")
        debugPrint("ID: \(newCategory.id)")
        debugPrint("Name: \(newCategory.name)")
        
        dataProvider.addCategory(newCategory) {}
    }
    
    /// Метод редактирования категории
    func editCategory(categoryId: String, name: String, icon: UIImage, mcc: Int16) {
        if let index = categories.firstIndex(where: { $0.id == categoryId }) {
            categories[index].name = name
            categories[index].icon = icon
            categories[index].mcc = mcc
            
            //dataProvider.editCategory() - сначала надо получить искомую категорию из сущности, отредактировать, а потом записать
        }
    }

    /// Метод удаления категории
    func deleteCategory(categoryId: String) {
        categories = categories.filter { $0.id != categoryId }
        
        //dataProvider.deleteCategory() - сначала надо получить все категории из сущности, удалить нужную и записать все обратно
    }

}
