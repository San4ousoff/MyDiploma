//
//  CashbackModelProtocol.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 07.02.2024.
//

import Foundation

// Протокол для описания свойств кэшбека
protocol CashbackProtocol {
    var id: String { get set }
    var categoryID: String { get }
    var cardID: String { get }
    var percentage: Double { get set }
}
