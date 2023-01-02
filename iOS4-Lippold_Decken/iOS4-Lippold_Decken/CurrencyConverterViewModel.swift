//
//  CurrencyConverterViewModel.swift
//  iOS4-Lippold_Decken
//
//  Created by  on 07.12.22.
//

import Foundation

class CurrencyConverterViewModel: ObservableObject {
    @Published private var currencyConverterModel = CurrencyConverterModel()

    var euroValue: String {
        get{
            String(format: "%.2lf", currencyConverterModel.euroValue)
        }
        
        set{
            if let value = Double(newValue){
                currencyConverterModel.euroValue = value
                
            }
        }
    }
    
    var dollarValue: String {
        get{
            String(format: "%.2lf",currencyConverterModel.dollarValue)
        }
        
        set{
            if let value = Double(newValue){
                currencyConverterModel.dollarValue = value
            }
        }
    }
    
    var poundValue: String {
        get{
            String(format: "%.2lf",currencyConverterModel.poundValue)
        }
        
        set{
            if let value = Double(newValue){
                currencyConverterModel.poundValue = value
            }
        }
    }
    
    var dollarRate: String {
        get{
            String(format: "%.2lf",currencyConverterModel.dollarRate)
        }
        
        set{
            if let value = Double(newValue){
                currencyConverterModel.dollarRate = value
            }
        }
    }
    
    var poundRate: String {
        get{
            String(format: "%.2lf",currencyConverterModel.poundRate)
        }
        
        set{
            if let value = Double(newValue){
                currencyConverterModel.poundRate = value
            }
        }
    }
    
    func refreshRatesEZB(){
        currencyConverterModel.refreshRatesEZB()
    }
}
