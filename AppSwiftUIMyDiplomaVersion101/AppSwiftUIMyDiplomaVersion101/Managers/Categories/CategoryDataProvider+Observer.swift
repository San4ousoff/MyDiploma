//
//  CategoryDataProvider+Observer.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 15.02.2024.
//

extension CategoryDataProvider {
    func addObserver(_ observer: CategoryDataProviderObserverProtocol) {
        observers.append(observer)
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.categoryDataDidChange()
        }
    }
}
