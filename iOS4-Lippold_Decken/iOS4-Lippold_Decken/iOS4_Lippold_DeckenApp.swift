//
//  iOS4_Lippold_DeckenApp.swift
//  iOS4-Lippold_Decken
//
//  Created by  on 07.12.22.
//

import SwiftUI

@main
struct iOS4_Lippold_DeckenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(currencyConverterViewModel: CurrencyConverterViewModel())
        }
    }
}
