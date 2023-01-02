//
//  BaseGlyph.swift
//  iOS2-Vorgabe
//
//  Created by  on 09.11.22.
//

import Foundation
import SwiftUI

class BaseGlyph: Glyph{
    var size: Double = 0.0
    
    var color: Color = Color.black
    
    var center: Point = Center(x: 0, y:0)
    
    var showDescription: Bool = false
    
    var area: Double {
        return 0.0
    }
    
    var perimeter: Double {
        return 0.0
    }
    
    func path() -> Path {
        return Path()
    }
}
