//
//  Complex.swift
//  iOS1-Lippold_Decken
//
//  Created by  on 26.10.22.
//

import Foundation

class Complex{
    var real: Double
    var imaginary: Double
    
    init(real: Double, imaginary: Double){
        self.real = real
        self.imaginary = imaginary
    }
    
    func incrementBy (addReal amount: Double){
        real += amount
    }
    
    func incrementBy (addImaginary amount: Double){
        imaginary += amount
    }
    
    func incrementBy (addComplex complex: Complex){
        self.real += complex.real
        self.imaginary += complex.imaginary
    }
    
    func multipyBy (complex: Complex){
        let selfReal = self.real
        self.real = self.real * complex.real - self.imaginary * complex.imaginary
        self.imaginary = selfReal * complex.imaginary + self.imaginary * complex.real
    }
    
    func rotateBy (angle: Double){
        self.multipyBy(complex: Complex(real: cos(angle), imaginary: sin(angle)))
    }
    
    func plus (addComplex complex: Complex) -> Complex{
        let newReal = self.real + complex.real;
        let newImaginary = self.imaginary + complex.imaginary;
        return Complex(real: newReal, imaginary: newImaginary)
    }
    
    func printComplexNumber(){
        print("(\(round(self.real * 10)/10) + \(round(self.imaginary * 10)/10) i)")
    }
}
