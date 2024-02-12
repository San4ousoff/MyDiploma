//
//  CashbackModel.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 07.02.2024.
//

import Foundation

// Реализация модели кэшбека, соответствующей протоколу CashbackProtocol
struct CashbackModel: CashbackProtocol {
    var id: String
    var categoryID: String
    var cardID: String
    var percentage: Double // Должно быть изменяемым

    init(id: String, categoryID: String, cardID: String, percentage: Double) {
        self.id = id
        self.categoryID = categoryID
        self.cardID = cardID
        self.percentage = percentage
    }
}
