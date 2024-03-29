//
//  CardManagerProtocol.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

// Протокол для работы с картами
import Foundation

protocol CardManagerProtocol {
    func getCards(completion: @escaping ([CardEntity]) -> Void)
    func addCard(_ name: String, _ imageData: Data, completion: @escaping () -> Void)
    func editCard(_ card: CardEntity)
    func deleteCard(_ card: CardEntity)
    //func deleteAllCards()
}

