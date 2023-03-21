//
//  CurencyList.swift
//  Money_Converter
//
//  Created by Ivan Yarmoliuk on 3/15/23.
//

import SwiftUI

struct CurencyList: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    
    @Binding var leftCurrency: Curency
    @Binding var rightCurrency: Curency

    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            //Background Image
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            //Vertical stack
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Curency icons
                Icon_Grid(currency: $leftCurrency)
                
            
                //Text
                Text("Select the curency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                //Curency Icons
                Icon_Grid(currency: $rightCurrency)
                Button ("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(8)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(17)
                
            }
        }
    }
}

struct CurencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurencyList(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
