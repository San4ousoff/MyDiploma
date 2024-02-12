//
//  TestCashbackModel.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 09.02.2024.
//

import Foundation

// Реализация модели кэшбека, соответствующей протоколу CashbackProtocol
struct TestCashbackModel {
    var category: String
    var percentage: Double

    init(category: String, percentage: Double) {
        self.category = category
        self.percentage = percentage
    }
}
