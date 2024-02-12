//
//  PlaceOfPaymentCollectionViewController+LogicMaxCashback.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 08.02.2024.
//

extension PlaceOfPaymentCollectionViewController {
    // MARK: - логика поиска карт с максимальным кэшбеком
    func findCardsWithMaxCashback(forCategory category: CategoryModel) -> [(CardModel, Double)] {
        var result: [(CardModel, Double)] = []
        
        let cashbacksForCategory = cashbacks.filter { $0.categoryID == category.id }
        
        if let maxCashbackPercentage = cashbacksForCategory.map({ $0.percentage }).max() {
            let maxCashbackCards = cashbacksForCategory.filter { $0.percentage == maxCashbackPercentage }
            
            for maxCashback in maxCashbackCards {
                if let bestCashbackCard = cards.first(where: { $0.id == maxCashback.cardID }) {
                    result.append((bestCashbackCard, maxCashback.percentage))
                }
            }
        }
        
        return result
    }
}

