//
//  PlaceOfPaymentCollectionViewController+SetupData.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 08.02.2024.
//

import UIKit

extension PlaceOfPaymentCollectionViewController {
    // MARK: - Ввод данных
    
    internal func setupData() {
        let happyCard = cards[0]
        let neutralCard = cards[1]
        let sadCard = cards[2]
        
        let cafeCategory = categories[0]
        let cinemaCategory = categories[1]
        let gasStationCategory = categories[2]
        
        cashbacks.append(CashbackModel(id: "1", categoryID: cafeCategory.id, cardID: happyCard.id, percentage: 10.0))
        cashbacks.append(CashbackModel(id: "2", categoryID: cinemaCategory.id, cardID: happyCard.id, percentage: 9.0))
        cashbacks.append(CashbackModel(id: "3", categoryID: gasStationCategory.id, cardID: happyCard.id, percentage: 8.0))
        
        cashbacks.append(CashbackModel(id: "4", categoryID: cinemaCategory.id, cardID: neutralCard.id, percentage: 9.5))
        cashbacks.append(CashbackModel(id: "5", categoryID: gasStationCategory.id, cardID: neutralCard.id, percentage: 7.5))
        
        cashbacks.append(CashbackModel(id: "6", categoryID: cafeCategory.id, cardID: sadCard.id, percentage: 6.0))
        cashbacks.append(CashbackModel(id: "7", categoryID: gasStationCategory.id, cardID: sadCard.id, percentage: 8.0))
        
        for cashback in cashbacks {
            if !uniqueCategories.contains(where: { $0.id == cashback.categoryID }) {
                if let category = categories.first(where: { $0.id == cashback.categoryID }) {
                    uniqueCategories.append(category)
                }
            }
        }
    }
}

