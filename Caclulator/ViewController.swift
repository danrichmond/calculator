//
//  ViewController.swift
//  Caclulator
//
//  Created by Dan on 10/14/17.
//  Copyright © 2017 Dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables
    var currentNumber:Double = 0
    var previousNumber:Double = 0
    var calculating = false
    var operation = 0
    @IBOutlet weak var label: UILabel!
    
    // Handle a number being clicked
    @IBAction func numbers(_ sender: UIButton) {
        
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
            // What do I do with the decimal?
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
        
        // If a button was pressed but not clear, equal, save, or copy
        if label.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 19 && sender.tag != 20 {
            
            // Save the previous number
            previousNumber = Double(label.text!)!
            operation = sender.tag
            calculating = true
        } else if sender.tag == 12 {    // Equal
            if operation == 13 {        // Add
                label.text = String(previousNumber + currentNumber)
            }
            else if operation == 14 {   // Subtract
                label.text = String(previousNumber - currentNumber)
            }
            else if operation == 15 {   // Multiply
                label.text = String(previousNumber * currentNumber)
            }
            else if operation == 16 {   // Divide
                label.text = String(previousNumber / currentNumber)
            }
            else if operation == 17 {   // Remainder
                label.text = String(Int(previousNumber) % Int(currentNumber))
            }
            calculating = false
        } else if sender.tag == 11 {
            label.text = "0"
            previousNumber = 0
            currentNumber = 0
            operation = 0
        }
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

