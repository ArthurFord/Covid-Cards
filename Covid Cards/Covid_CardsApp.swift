//
//  Covid_CardsApp.swift
//  Covid Cards
//
//  Created by Arthur Ford on 10/3/21.
//

import SwiftUI

@main
struct Covid_CardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CardsListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
