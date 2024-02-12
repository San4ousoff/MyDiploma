//
//  CategoryManager.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 01.02.2024.
//

// Реализация менеджера категорий
import UIKit
import CoreData

class CategoryManager: CategoryManagerProtocol, CategoryDataProviderObserver {
    
    var categories: [CategoryModel] = []
    
    // Исправленный код для dataProvider в CategoryManager

    lazy var dataProvider: CategoryDataProvider = {
        let coreDataStack = CoreDataStack.shared // Предположим, что у вас есть CoreDataStack
        let categoryDataProvider = CategoryDataProvider(context: coreDataStack.context)
        return categoryDataProvider
    }()

    /// Метод получения списка категорий
    func getCategories(completion: @escaping ([CategoryModel]) -> Void) {
        debugPrint("Метод CategoryManager.getCategories запущен")
        dataProvider.getCategories(completion: completion)
    }
    
    /// Метод добавления категории
    func addCategory(_ name: String, _ icon: UIImage, _ mcc: Int16) {
        let newCategory = CategoryModel(id: UUID().uuidString, name: name, icon: icon, mcc: mcc)
        categories.append(newCategory)
        
        // TODO: отладка
        debugPrint("Метод CategoryManager.addCategory запущен")
        debugPrint("Добавляемая категория в массив:")
        debugPrint("ID: \(newCategory.id)")
        debugPrint("Name: \(newCategory.name)")
                
        dataProvider.addCategory(newCategory) {
            self.dataProvider.notifyObservers()
        }
    }
    
    /// Метод редактирования категории
    func editCategory(categoryId: String, name: String, icon: UIImage, mcc: Int16) {
        if let index = categories.firstIndex(where: { $0.id == categoryId }) {
            categories[index].name = name
            categories[index].icon = icon
            categories[index].mcc = mcc
            
            dataProvider.notifyObservers()
        }
    }

    /// Метод удаления категории
    func deleteCategory(categoryId: String) {
        categories = categories.filter { $0.id != categoryId }
        
        dataProvider.notifyObservers()
    }
    
    func categoryDataDidChange() {
        // Вызываем метод getCategories(completion:) с передачей замыкания обработчика завершения
        getCategories { categories in
            // В этом замыкании вы можете использовать полученные категории
            for category in categories {
                print("ID: \(category.id), Name: \(category.name)")
            }
        }
    }
}






