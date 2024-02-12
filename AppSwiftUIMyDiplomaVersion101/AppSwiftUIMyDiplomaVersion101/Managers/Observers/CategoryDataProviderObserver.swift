//
//  CategoryDataProviderObserver.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 09.02.2024.
//

import CoreData

protocol CategoryDataProviderObserver: AnyObject {
    func categoryDataDidChange()
}
