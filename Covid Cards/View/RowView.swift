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
        Text(card.nameOnCard!)
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
