//
//  CardModel.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

// Реализация модели карты, соответствующей протоколу CardProtocol
class CardModel: CardProtocol {
    var id: UUID?
    var name: String?
    var image: UIImage?

    init(name: String, image: UIImage) {
        self.id = UUID() // генерация нового UUID
        self.name = name
        self.image = image
    }
}


