//
//  Icon_Grid.swift
//  Money_Converter
//
//  Created by Ivan Yarmoliuk on 3/19/23.
//

import SwiftUI

struct Icon_Grid: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Curency
    
    @AppStorage("currency") var storedCurrency: Int?
    
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5) { i in
                if Curency.allCases[i] == currency {
                    CoinButton(imagename: CurencyImage.allCases[i].rawValue, text: CurencyText.allCases[i].rawValue)
                        .opacity(0.5)
                    
                } else {
                    CoinButton(imagename: CurencyImage.allCases[i].rawValue, text: CurencyText.allCases[i].rawValue)
                        .shadow(color: .black, radius: 9)
                        .onTapGesture {
                            currency = Curency.allCases[i]
                        }
                }
                
            }
        }
        .padding([.trailing, .leading, .bottom])
    }
}

struct Icon_Grid_Previews: PreviewProvider {
    static var previews: some View {
        Icon_Grid(currency: .constant(.goldPiece))
    }
}
