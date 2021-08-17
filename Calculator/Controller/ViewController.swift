//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    private var displayValue : Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Error while converting label text to Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
            if let result = calculator.calculate(operation: calcMethod){
                displayValue = result
            }
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber {
                if numValue == "."{
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else{
                if numValue == "." && displayLabel.text!.contains("."){
                    return
                }
                displayLabel.text! += numValue
            }
        }
    }
}

