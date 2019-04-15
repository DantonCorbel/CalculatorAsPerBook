//
//  Calculate.swift
//  CalculatorAsPerBook
//
//  Created by Deb Santa Clara on 14/04/19.
//  Copyright © 2019 Deb Santa Clara. All rights reserved.
//

import Foundation

struct Calculate {
    var display: String
    var storeNumberOne: Double
    var storeNumberTwo: Double
    var storeNumberThree: Double
    var signCase: Sign
    var answer: Double
    
    mutating func displayNumber(num: String) {
        if display == "0" {
            display = ""
        }
        display += num
        storeNumberThree = Double(display)!
    }
    
    mutating func changeSign() {
        storeNumberThree -= (storeNumberThree*2)
        display = String(storeNumberThree)
    }
    
    mutating func storeToNumberOne() {
        storeNumberOne = Double(display)!
        display = ""
    }
    
    mutating func storeToNumberTwo() {
        storeNumberTwo = Double(display)!
        display = ""
    }
    
    mutating func enumCase(sign: String) {
        if sign == "+" {
            signCase = .add
        } else if sign == "-" {
            signCase = .subtract
        } else if sign == "x" {
            signCase = .multiply
        } else if sign == "÷" {
            signCase = .divide
        }
    }
    
    mutating func makeCalculation(x: Double, y: Double, sign: Sign) {
            switch sign {
            case .add:
                answer = x+y
            case .subtract:
                answer = x-y
            case .divide:
                guard y != 0 else {return}
                answer = x/y
            case .multiply:
                answer = x*y
        }
    }
}

enum Sign {
    case add, subtract, divide, multiply

}
