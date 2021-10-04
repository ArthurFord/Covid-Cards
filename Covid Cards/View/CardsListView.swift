    //
    //  CardsListView.swift
    //  Covid Cards
    //
    //  Created by Arthur Ford on 10/3/21.
    //

import SwiftUI
import CoreData


struct CardsListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Card.nameOnCard, ascending: true)],
        animation: .default)
    private var cards: FetchedResults<Card>
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Divider()
                    ForEach(cards) { card in
                        NavigationLink {
                            CardDetailView(context: viewContext, card: card)
                        } label: {
                            RowView(card: card)
                        }
                        Divider()
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            showingSheet.toggle()
                        }, label: {
                            HStack {
                            Image(systemName: "plus")
                                Text("Add member")
                            }
                        })
                            .sheet(isPresented: $showingSheet) {
                                NewCardSheetView(context: viewContext)
                            }
                    }
                }
                .navigationBarTitle("Vaccine Cards")
                
            }
        }
    }
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { cards[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
