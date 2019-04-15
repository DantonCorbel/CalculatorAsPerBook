//
//  ViewController.swift
//  CalculatorAsPerBook
//
//  Created by Deb Santa Clara on 4/04/19.
//  Copyright © 2019 Deb Santa Clara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var calculate: Calculate!

    
    //Outlets
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet var signButtons: [UIButton]!
    @IBOutlet var allButtons: [UIButton]!
    
    //Actions
    @IBAction func numberButtons(_ sender: UIButton) {
        let num = sender.title(for: .normal)!
        calculate.displayNumber(num: num)
        displayLabel.text = calculate.display
        allClearButton.isHidden = true
        clearButton.isHidden = false
        resetSignColours()
        
        print("Number button: storeOne: \(calculate.storeNumberOne), storeTwo: \(calculate.storeNumberTwo), storeThree: \(calculate.storeNumberThree), display: \(calculate.display), number pressed: \(num)")
    }
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        reset()
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        clearButton.isHidden = true
        allClearButton.isHidden = false
        calculate.display = ""
        displayLabel.text = "0"
        
        print("Clear button: storeOne: \(calculate.storeNumberOne), storeTwo: \(calculate.storeNumberTwo), storeThree: \(calculate.storeNumberThree), display: \(calculate.display)")
    }
    
    @IBAction func signButtonsTapped(_ sender: UIButton) {
        let sign = sender.title(for: .normal)!
        resetSignColours()
        sender.backgroundColor = UIColor.orange
        
        if calculate.display.isEmpty {
            //this allows change in signs if press wrong sign button, but only once!
        }
        else if calculate.storeNumberOne == 0 {
            calculate.storeToNumberOne()
            
            print("Sign button: storeOne: \(calculate.storeNumberOne), storeTwo: \(calculate.storeNumberTwo), storeThree: \(calculate.storeNumberThree), display: \(calculate.display), sign: \(sign), signCase: \(calculate.signCase)")
        } else if calculate.storeNumberTwo == 0 {
            equals()
            
            print("Sign after equals button: storeOne: \(calculate.storeNumberOne), storeTwo: \(calculate.storeNumberTwo), storeThree: \(calculate.storeNumberThree), display: \(calculate.display), sign: \(sign), answer: \(calculate.answer)")
            
            calculate.display = "0"
        }
        
        calculate.enumCase(sign: sign)
       
    }
    
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        guard !calculate.display.isEmpty else {
            return
        }
        equals()
        calculate.display = ""
    }
    @IBAction func alternativeSignButtonTapped(_ sender: UIButton) {
        calculate.changeSign()
        displayLabel.text = calculate.display
     //
        print("changeSign: storeOne: \(calculate.storeNumberOne), storeTwo: \(calculate.storeNumberTwo), storeThree: \(calculate.storeNumberThree), display: \(calculate.display)")
    }
    @IBAction func percentSignTapped(_ sender: UIButton) {
        calculate.percentSign()
        displayLabel.text = calculate.display
    }
    
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for button in allButtons {
            button.layer.cornerRadius = 5
        }
        reset()
    }
    
    func reset() {
        clearButton.isHidden = true
        allClearButton.isHidden = false
        calculate = Calculate(display: "", storeNumberOne: 0, storeNumberTwo: 0, storeNumberThree: 0, signCase: .add, answer: 0)
        displayLabel.text = "0"
        
        print("Reset: storeOne: \(calculate.storeNumberOne), storeTwo: \(calculate.storeNumberTwo), storeThree: \(calculate.storeNumberThree), display: \(calculate.display)")
    }

    func resetSignColours() {
        for button in signButtons {
            button.backgroundColor = UIColor.red
        }
    }
    
    func equals() {
        calculate.storeToNumberTwo()
        calculate.makeCalculation(x: calculate.storeNumberOne, y: calculate.storeNumberTwo, sign: calculate.signCase)
        displayLabel.text = String(calculate.answer)
        calculate.storeNumberOne = calculate.answer
        calculate.storeNumberTwo = 0
        
        
        print("Equals button: storeOne: \(calculate.storeNumberOne), storeTwo: \(calculate.storeNumberTwo), storeThree: \(calculate.storeNumberThree), display: \(calculate.display), answer: \(calculate.answer)")
    }
}

