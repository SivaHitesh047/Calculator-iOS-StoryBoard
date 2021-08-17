//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Siva Hitesh Kasturi.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalculation : (operation : String, n1 : Double)?
    
    mutating func setNumber(_ number : Double){
        self.number = number
    }
    
    mutating func calculate(operation calcMethod : String) -> Double?{
       
        if let n = number{
            if calcMethod == "+/-"{
                return n * -1
            }
            else if calcMethod == "AC"{
                return 0
            }
            else if calcMethod == "%"{
                return n/100
            }
            else if calcMethod == "="{
                return twoNumberCalculation(n2 : n)
            }else{
                intermediateCalculation = (calcMethod,n)
            }
        }
        
        return nil
    }
    
    private func twoNumberCalculation(n2 : Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            if operation == "+"{
                return n1+n2
            }
            else if operation == "-"{
                return n1-n2
            }
            else if operation == "×"{
                return n1*n2
            }
            else if operation == "÷"{
                return n1/n2
            }
            else{
                fatalError("The operation does not match any of the cases")
            }
        }
        
        return nil
    }
}
