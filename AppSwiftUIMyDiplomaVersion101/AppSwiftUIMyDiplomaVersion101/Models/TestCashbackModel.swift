//
//  TestCashbackModel.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 09.02.2024.
//

import Foundation

// TODO: тестовая модель для заглушки нерешенной задачи по созданию сущности Кэшбека из сущностей Карты и Категории из вью Добавить новую карту
struct TestCashbackModel {
    var category: String
    var percentage: Double

    init(category: String, percentage: Double) {
        self.category = category
        self.percentage = percentage
    }
}
