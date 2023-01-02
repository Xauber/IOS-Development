//
//  Circle.swift
//  iOS2-Vorgabe
//
//  Created by  on 09.11.22.
//

import Foundation
import SwiftUI

class Circle: BaseGlyph{
    override var area: Double {
        return size/2*size/2*Double.pi
    }
    
    override var perimeter: Double {
        return size/2 * 2 * Double.pi
    }
    
    override func path() -> Path {
        return DrawHelper.pathForCircle(centerX: center.x, centerY: center.y, size: size)
    }
}
