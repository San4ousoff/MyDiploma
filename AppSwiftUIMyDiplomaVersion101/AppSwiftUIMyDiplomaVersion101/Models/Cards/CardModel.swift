//
//  CardModel.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

// Реализация модели карты, соответствующей протоколу CardProtocol
struct CardModel: CardModelProtocol {
    var id: String
    var name: String
    var image: UIImage

    init(id: String, name: String, image: UIImage) {
        self.id = id
        self.name = name
        self.image = image
    }
}


