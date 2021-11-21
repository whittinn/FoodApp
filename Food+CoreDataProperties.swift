//
//  Food+CoreDataProperties.swift
//  FoodApp
//
//  Created by Nathaniel Whittington on 11/21/21.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var addedFood: Date?
    @NSManaged public var foodType: String?

}

extension Food : Identifiable {

}
