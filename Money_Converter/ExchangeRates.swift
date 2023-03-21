//
//  ExchangeRates.swift
//  Money_Converter
//
//  Created by Ivan Yarmoliuk on 3/15/23.
//

import SwiftUI

struct ExchangeRates: View {
    
    @State var leftImage: String
    @State var text: String
    @State var rightImage: String
    
    var body: some View {
        HStack{
            //Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            //Text
            Text(text)
            //equel sigh
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRates_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRates(leftImage: "goldpiece", text: "1 Gold Piece =  Golden Penies", rightImage: "goldpenny")
            .previewLayout(.sizeThatFits)
    }
}
