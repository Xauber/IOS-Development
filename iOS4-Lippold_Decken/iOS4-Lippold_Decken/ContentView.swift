//
//  ContentView.swift
//  iOS4-Lippold_Decken
//
//  Created by  on 07.12.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var currencyConverterViewModel: CurrencyConverterViewModel
    
    
    var body: some View {
        VStack {
            Text("Convert Currency 💸").font(.title)
            HStack{
                Text("€ → $ Rate")
                TextField("€ → $", text: $currencyConverterViewModel.dollarRate)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Text("€ → £ Rate")
                TextField("€ → £", text: $currencyConverterViewModel.poundRate)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                TextField("Euro value", text: $currencyConverterViewModel.euroValue)
                    .textFieldStyle(.roundedBorder)
                Text("€")
            }
            HStack{
                TextField("Dollar", text: $currencyConverterViewModel.dollarValue)
                    .textFieldStyle(.roundedBorder)
                Text("$")
            }
            HStack{
                TextField("Pound value", text: $currencyConverterViewModel.poundValue)
                    .textFieldStyle(.roundedBorder)
                Text("£")
            }
            Button("Refresh Exchange Rate Online") {
                currencyConverterViewModel.refreshRatesEZB()
            }
            .padding()
            Text("The Exchange Rates are sourced from the European Central Bank")
                .font(.footnote)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(-2.0)
            Spacer()
        }
        .padding()
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.556, saturation: 0.171, brightness: 0.763)/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currencyConverterViewModel: CurrencyConverterViewModel())
    }
}
