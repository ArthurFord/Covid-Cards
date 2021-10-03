//
//  CardDetailView.swift
//  Covid Cards
//
//  Created by Arthur Ford on 10/3/21.
//

import SwiftUI
import CoreData



struct CardDetailView: View {
    var context: NSManagedObjectContext!
    
    var card: Card
    
    var body: some View {
        VStack {
            Text(card.nameOnCard ?? "Name")
                .font(.largeTitle)
                .padding()
            HStack(spacing: 10) {
                Text("Date Vaccinated:")
                Text(card.vaccineDate!, style: .date)
            }
            .padding()
            .font(.title2)
            HStack(spacing: 10) {
                Text("Date Added:")
                Text(card.dateAdded!, style: .date)
            }.padding()
                .font(.title2)
            Image(uiImage: (UIImage(data: card.card!)!))
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 2)
            Spacer()
        }
        
    }
    
}



//struct CardDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardDetailView(card: dummyCard)
//    }
//}
