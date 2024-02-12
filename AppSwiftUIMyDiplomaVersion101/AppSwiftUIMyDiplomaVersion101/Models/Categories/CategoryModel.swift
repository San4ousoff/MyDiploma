//
//  CategoryModelWithString.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 09.02.2024.
//

import UIKit

// Реализация модели категории, соответствующей протоколу CategoryModelProtocol для реализации методов получения, редактирования и удаления данных из БД
struct CategoryModel: CategoryModelProtocol {
    var id: String
    var name: String
    var icon: UIImage
    var mcc: Int16

    init(id: String, name: String, icon: UIImage, mcc: Int16) {
        self.id = id
        self.name = name
        self.icon = icon
        self.mcc = mcc
    }
}
