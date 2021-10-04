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
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Text(card.nameOnCard!)
                .font(.largeTitle)
                .padding()
            HStack {
                Text("Vaccine Date:")
                    .font(.title2)
                    .padding(.leading, 20)
                Text(card.vaccineDate!, style: .date)
                    .font(.title2)
                    .padding(.trailing, 20)
            }
            .padding(.bottom, 10)
            
                Image(uiImage: (UIImage(data: card.card!)!))
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .gesture(MagnificationGesture()
                                .onChanged { value in
                        scale = value.magnitude
                    })
            
        }
    }
    
}



    //struct CardDetailView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        CardDetailView(card: dummyCard)
    //    }
    //}




