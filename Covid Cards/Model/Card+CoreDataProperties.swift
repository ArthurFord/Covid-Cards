//
//  Card+CoreDataProperties.swift
//  Covid Cards
//
//  Created by Arthur Ford on 10/3/21.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var nameOnCard: String?
    @NSManaged public var card: Data?
    @NSManaged public var dateAdded: Date?
    @NSManaged public var vaccineDate: Date?

}

extension Card : Identifiable {

}
