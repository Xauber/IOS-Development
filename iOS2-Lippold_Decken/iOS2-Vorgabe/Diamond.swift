//
//  Diamond.swift
//  iOS2-Vorgabe
//
//  Created by  on 09.11.22.
//

import Foundation
import SwiftUI

class Diamond: BaseGlyph{
    override var area: Double {
        return size*size/2
    }
    
    override var perimeter: Double {
        return sqrt(pow(size/2, 2)+pow(size/2, 2))*4
    }
    
    override func path() -> Path {
        return DrawHelper.pathForDiamond(centerX: center.x, centerY: center.y, size: size)
    }
}
