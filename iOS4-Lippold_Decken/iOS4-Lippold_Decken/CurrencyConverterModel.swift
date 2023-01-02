//
//  CurrencyConverterModel.swift
//  iOS4-Lippold_Decken
//
//  Created by  on 07.12.22.
//

import Foundation

struct CurrencyConverterModel{
    var euroValue = 1.0
    
    var dollarRate = 1.4
    
    var poundRate = 0.6
    
    var dollarValue: Double{
        get{
            euroValue * dollarRate
        }
        set{
            euroValue = newValue/dollarRate
        }
    }
    
    var poundValue: Double{
        get{
            euroValue * poundRate
        }
        set{
            euroValue = newValue/poundRate
        }
    }
    
    mutating func refreshRatesEZB() {
        let url = URL(string: "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml")
        if let _url = url {
            var xml = try? String(contentsOf: _url, encoding: .utf8)
            if let _xml = xml{
                
                let USDRange = _xml.range(of: "\"USD\" rate=\"")
                if let _USDRange = USDRange{
                    let dollarSubStart = _USDRange.upperBound
                    var dollarSubstring = _xml[dollarSubStart...]
                    let dollarSubEnd = dollarSubstring.range(of: "\"")
                    if let _dollarSubEnd = dollarSubEnd{
                        dollarSubstring  = dollarSubstring[..._dollarSubEnd.lowerBound]
                        dollarSubstring = dollarSubstring.dropLast()
                        if let dollarRateDouble = Double(dollarSubstring){
                            dollarRate = dollarRateDouble
                        }
                    }
                }
                let GBPRange = _xml.range(of: "\"GBP\" rate=\"")
                if let _GBPRange = GBPRange{
                    let poundSubStart = _GBPRange.upperBound
                    var poundSubstring = _xml[poundSubStart...]
                    let poundSubEnd = poundSubstring.range(of: "\"")
                    if let _poundSubEnd = poundSubEnd{
                        poundSubstring  = poundSubstring[..._poundSubEnd.lowerBound]
                        poundSubstring = poundSubstring.dropLast()
                        if let poundRateDouble = Double(poundSubstring){
                            poundRate = poundRateDouble
                        }
                    }
                }
            }
        }
    }
}
