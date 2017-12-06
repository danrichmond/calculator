//  ViewController.swift
//  Caclulator
//
//  Created by Dan on 10/14/17.
//  Copyright © 2017 Dan. All rights reserved.

import UIKit

var calcVal = ""
var numberOfCalcs = 0

class ViewController: UIViewController {

    // Variables
    var currentNumber:Double = 0
    var previousNumber:Double = 0
    var calculating = false
    var operation = 0
    var didCalculation = false
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var calcName: UITextField!
    
    // Handle a number being clicked
    @IBAction func numbers(_ sender: UIButton) {
        
        if didCalculation == true {
            label.text = "0"
            currentNumber = 0
            didCalculation = false
        }
        
        if label.text == "0" {
            label.text = ""
        }
        
        if calculating == true {
            label.text = String(sender.tag - 1)
            currentNumber = Double(label.text!)!
            calculating = false
        } else {
            label.text = label.text! + String(sender.tag - 1)
            currentNumber = Double(label.text!)!
        }
    }
    
    // Change number from pos to neg or neg to pos
    @IBAction func invert(_ sender: UIButton) {
        currentNumber = Double(label.text!)!
        label.text = String(currentNumber * -1)
        currentNumber = currentNumber * -1
    }
    
    // Handle an operator button being pressed
    @IBAction func buttons(_ sender: UIButton) {
        
        if sender.tag == 0 {
            label.text = label.text! + "."
            calculating = false
        } else if label.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 19 && sender.tag != 20 { // Not clear, equal, save, or copy
            // Save the previous number
            previousNumber = Double(label.text!)!
            operation = sender.tag
            calculating = true
        } else if sender.tag == 12 {    // Equal
            if operation == 13 {        // Add
                label.text = String(previousNumber + currentNumber)
            } else if operation == 14 {   // Subtract
                label.text = String(previousNumber - currentNumber)
            } else if operation == 15 {   // Multiply
                label.text = String(previousNumber * currentNumber)
            } else if operation == 16 {   // Divide
                label.text = String(previousNumber / currentNumber)
            } else if operation == 17 {   // Remainder
                label.text = String(Int(previousNumber) % Int(currentNumber))
            }
            calculating = false
            didCalculation = true
        } else if sender.tag == 11 {
            label.text = "0"
            previousNumber = 0
            currentNumber = 0
            operation = 0
        } else if sender.tag == 20 {    // Copy button
            UIPasteboard.general.string = label.text
        }
        
    }
    
    @IBAction func save1Pressed(_ sender: UIButton) {
        calcVal = label.text!
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if calcName.text! == "" {
            guard let calc = Calculation(name: "Calculation " + String(numberOfCalcs), value: calcVal) else {
                fatalError("Unable to instantiate calc1")
            }
            calculations += [calc]
        } else {
            guard let calc1 = Calculation(name: calcName.text!, value: calcVal) else {
                fatalError("Unable to instantiate calc1")
            }
            calculations += [calc1]
        }
        numberOfCalcs = numberOfCalcs + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
