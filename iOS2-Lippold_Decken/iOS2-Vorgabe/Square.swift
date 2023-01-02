//
//  Square.swift
//  iOS2-Vorgabe
//
//  Created by  on 09.11.22.
//

import Foundation
import SwiftUI

class Square: BaseGlyph{
    override var area: Double {
        return size * size
    }
    
    override var perimeter: Double {
        return size * 4
    }
    
    override func path() -> Path {
        return DrawHelper.pathForSquare(centerX: center.x, centerY: center.y, size: size)
    }
}
