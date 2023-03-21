//
//  ExchangeInfo.swift
//  Money_Converter
//
//  Created by Ivan Yarmoliuk on 3/15/23.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            //Backgroung image
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack { //*2 text, hstack with 4 coin info, Done button
                //Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    
                //Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                //4 Hstacks with info
                ExchangeRates(leftImage: "goldpiece", text: "1 Gold Piece =  Golden Penies", rightImage: "goldpenny")
                ExchangeRates(leftImage: "goldpenny", text: "1 Gold Penny = 4 Silver Piece", rightImage: "silverpiece")
                ExchangeRates(leftImage: "silverpiece", text: "1 Silver Piece = 4 Silver Pennies", rightImage: "silverpenny")
                ExchangeRates(leftImage: "silverpenny", text: "1 Silver Penny = 100 Coper Pennies", rightImage: "copperpenny")
                //Done button
                Button ("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(8)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(17)
                
                
            }
            .foregroundColor(.black)
        }
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
            .preferredColorScheme(.dark)
    }
}
