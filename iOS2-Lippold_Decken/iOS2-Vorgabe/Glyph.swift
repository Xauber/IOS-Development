//
//  Glyph.swift
//  iOS2-Vorgabe
//
//  Created by Klaus Jung on 23.09.21.
//

import SwiftUI

protocol Glyph {
    var size: Double { get set }
    var color: Color { get set }
    var center: Point { get set }
    var showDescription: Bool { get set }
    
    func path() -> Path
    
    var area: Double { get }
    var perimeter: Double { get }
}

protocol Point {
    var x: Double { get set }
    var y: Double { get set }
}


