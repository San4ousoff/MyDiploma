//
//  CategoryModelProtocol.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 07.02.2024.
//

import UIKit

// Протокол для описания свойств категории
protocol CategoryModelProtocol {
    var id: String { get set }
    var name: String { get set }
    var icon: UIImage { get set }
    var mcc: Int16 { get set }
}
