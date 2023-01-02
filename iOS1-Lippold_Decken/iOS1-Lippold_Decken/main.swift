//
//  main.swift
//  iOS1-Lippold_Decken
//
//  Created by  on 26.10.22.
//

import Foundation

print("Hello and welcome, please type a double here!")

func readDouble() -> Double {
    let input = readLine()
    
    if let actualInput = input{
        let double = Double(actualInput)
        
        if let actualNumber = double{
            return actualNumber
        }else{
            return 0.0
        }
    }
    return 0.0
}

print("Type the Real Part of the Complexnumber here:")
let realPart = readDouble()

print("Type the Imaginary Part of the Complexnumber here:")
let imaginaryPart = readDouble()

let complexNumber = Complex(real: realPart, imaginary: imaginaryPart)
complexNumber.printComplexNumber()

let addComplex = Complex(real: 1.2, imaginary: 2.4)
complexNumber.incrementBy(addComplex: addComplex)
complexNumber.printComplexNumber()

complexNumber.incrementBy(addReal: 2.2)
complexNumber.printComplexNumber()

complexNumber.incrementBy(addImaginary: 0.6)
complexNumber.printComplexNumber()

let multiplyComplex = Complex(real: 0.5, imaginary: 1.0)
complexNumber.multipyBy(complex: multiplyComplex)
complexNumber.printComplexNumber()

complexNumber.rotateBy(angle: Double.pi)
complexNumber.printComplexNumber()

let plusComplex = Complex(real: 0.2, imaginary: 0.9)
let newComplex = complexNumber.plus(addComplex: plusComplex)
newComplex.printComplexNumber()
