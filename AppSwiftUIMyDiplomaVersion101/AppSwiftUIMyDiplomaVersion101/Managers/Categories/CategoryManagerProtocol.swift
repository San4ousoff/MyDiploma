//
//  CategoryManagerProtocol.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 01.02.2024.
//

/// Протокол для работы с категориями
import UIKit

protocol CategoryManagerProtocol {
    func getCategories(completion: @escaping ([CategoryModel]) -> Void)
    func addCategory(_ name: String, _ icon: UIImage, _ mcc: Int16)
    func editCategory(categoryId: String, name: String, icon: UIImage, mcc: Int16)
    func deleteCategory(categoryId: String)
}
