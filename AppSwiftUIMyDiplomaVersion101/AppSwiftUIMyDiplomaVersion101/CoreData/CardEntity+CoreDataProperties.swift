//
//  CardEntity+CoreDataProperties.swift
//  
//
//  Created by Mac on 23.01.2024.
//
//

import Foundation
import CoreData


extension CardEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardEntity> {
        return NSFetchRequest<CardEntity>(entityName: "CardEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var image: Data?

}
