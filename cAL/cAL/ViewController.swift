//
//  ViewController.swift
//  cAL
//
//  Created by DP on 16/3/4.
//  Copyright © 2016年 DP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isUserInMiddleOfTyping = false
    @IBOutlet weak var display: UILabel!
    
    @IBAction func appendDigit(sender: UIButton) {
        let num = sender.currentTitle!
        if isUserInMiddleOfTyping
        {
            display.text = display.text! + num
        }else
        {
            display.text = num
            isUserInMiddleOfTyping = true
        }
    }
    var operandStack = Array<Double>()
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if isUserInMiddleOfTyping {
            enter()
        }
        switch operation  {
        case "+":
            if operandStack.count >= 2 {
            displayvalue = operandStack.removeLast() * operandStack.removeLast()
                enter()
            }
                break
//        case "−":
//        case "×":
//        case "÷":
        default: break
        }
    }
    @IBAction func enter() {
        isUserInMiddleOfTyping = false
        operandStack.append(displayvalue)
        print("operandstack:\(operandStack)")
    }
    
    
    var displayvalue: Double {
        get {
            
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            isUserInMiddleOfTyping = false
        }
        
    }
    
    
}

