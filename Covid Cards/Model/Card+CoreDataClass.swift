//
//  Card+CoreDataClass.swift
//  Covid Cards
//
//  Created by Arthur Ford on 10/3/21.
//
//

import Foundation
import CoreData
import SwiftUI

@objc(Card)
public class Card: NSManagedObject {

    @Environment(\.managedObjectContext) private var viewContext
    
    
}

var dummyCard = Card()
