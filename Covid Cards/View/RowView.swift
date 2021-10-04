    //
    //  RowView.swift
    //  Covid Cards
    //
    //  Created by Arthur Ford on 10/3/21.
    //

import SwiftUI

struct RowView: View {
    var card: Card
    
    var body: some View {
        HStack {
            Image(uiImage: (UIImage(data: card.card!)!))
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading)
            VStack(alignment: .leading) {
                Text(card.nameOnCard!)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                Text("Vaccinated since: \(card.vaccineDate!, style: .date)")
                    .font(.caption)
                    .foregroundColor(.darkerGray)
                    
            }
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing)
        }
    }
}

    //struct RowView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        RowView()
    //    }
    //}
