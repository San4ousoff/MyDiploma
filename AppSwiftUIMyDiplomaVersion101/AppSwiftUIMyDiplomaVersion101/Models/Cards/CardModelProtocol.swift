//
//  CardProtocol.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

// Протокол для описания свойств карты
protocol CardModelProtocol {
    var id: String { get set }
    var name: String { get set }
    var image: UIImage { get set }
}

