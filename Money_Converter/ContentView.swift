//
//  ContentView.swift
//  Money_Converter
//
//  Created by Ivan Yarmoliuk on 3/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    
    @AppStorage("left") var leftCurrencyStorage: Int = 0
    @AppStorage("right") var rightCurrencyStarage: Int = 0
    
    @State var leftCurrency: Curency = Curency.allCases[0]
    @State var rightCurrency: Curency = Curency.allCases[0]
    
    @Environment(\.colorScheme) var mode
    
    
    @State var showSelectedCurrency = false
    @State var showExchageInfo = false
    
    var body: some View {
        ZStack {
            //Background image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                //Pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .onAppear()
                //Curency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                HStack { //*curency converter section
                    
                    VStack{//*Left conversion section
                        HStack {//*Coin Image with text
                            //Coin image
                           
                            Image(CurencyImage.allCases[Curency.allCases.firstIndex(of: leftCurrency) ?? 0].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                                .onAppear(perform: {
                                    self.leftCurrency = Curency.allCases[self.leftCurrencyStorage]
                                    self.rightCurrency = Curency.allCases[self.rightCurrencyStarage]
                                })
                                .onDisappear {
                                    self.leftCurrencyStorage = Curency.allCases.firstIndex(of: leftCurrency) ?? 0
                                    self.rightCurrencyStarage = Curency.allCases.firstIndex(of: rightCurrency) ?? 0
                                    print(self.leftCurrencyStorage)
                                    print(self.rightCurrencyStarage)
                                }
                            //Text
                            Text(CurencyText.allCases[Curency.allCases.firstIndex(of: leftCurrency) ?? 0].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(-4)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        
                        }
                        .sheet(isPresented: $showSelectedCurrency) {
                            CurencyList(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                    
                        
                    //Text field
                        TextField("Amount", text: $leftAmount, onEditingChanged: { typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(self.mode == .dark ? Color(UIColor.systemBrown) : Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .keyboardType(.decimalPad )
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency) { _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onDisappear {
                                self.leftAmount = ""
                            }
                    }
                    
                 //Equal sigh
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    VStack{    //*Right conversion section
                        HStack {//*text with price and image
                            // text price
                            Text(CurencyText.allCases[Curency.allCases.firstIndex(of: rightCurrency) ?? 0].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            //Image
                            Image(CurencyImage.allCases[Curency.allCases.firstIndex(of: rightCurrency) ?? 0].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(-4)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectedCurrency) {
                            CurencyList(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        //Text field
                        TextField("Amount", text: $rightAmount,  onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(self.mode == .dark ? Color(UIColor.systemBrown336389HHH) : Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onDisappear {
                                self.rightAmount = ""
                            }
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                Spacer()
                
                //Info button
                HStack {
                    Spacer()
                    Button {
                        //Displays exchange info screen
                        showExchageInfo.toggle()
        
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.trailing)
                .sheet(isPresented: $showExchageInfo) {
                    ExchangeInfo()
                }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
