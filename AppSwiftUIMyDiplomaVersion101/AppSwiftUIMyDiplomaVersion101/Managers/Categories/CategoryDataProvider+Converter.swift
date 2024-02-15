//
//  CategoryDataProvider+Converter.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 15.02.2024.
//

import UIKit

extension CategoryDataProvider {
    func convertCategoryEntityToModel(_ categoryEntity: CategoryEntity) -> CategoryModel {
        return CategoryModel(id: categoryEntity.id ?? "", name: categoryEntity.name ?? "", icon: UIImage(), mcc: categoryEntity.mcc)
    }
}
