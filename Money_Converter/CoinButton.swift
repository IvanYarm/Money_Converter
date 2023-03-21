//
//  CoinButton.swift
//  Money_Converter
//
//  Created by Ivan Yarmoliuk on 3/15/23.
//

import SwiftUI

struct CoinButton: View {
    
    @State var imagename: String
    @State var text: String
    
    var body: some View {
        
            
            ZStack {
                
                Image(imagename)
                    .resizable()
                    .scaledToFit()
                    
                    
                
                VStack {
                    Spacer()
                    
                    Text(text)
                        .font(.caption)
                        .background(.brown.opacity(0.75))
                    .foregroundColor(.black)
                    .padding(3)
                }
                    
                
            }
            .frame(width: 100, height: 100)
            .background(.brown)
            .cornerRadius(10)
            .padding(3)
        }
    }


struct CoinButton_Previews: PreviewProvider {
    static var previews: some View {
        CoinButton(imagename: "goldpiece", text: "Copper Penny")
            .previewLayout(.sizeThatFits)
    }
}
