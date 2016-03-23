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
            performOperation{$0 + $1}
        case "−":performOperation{$0 - $1}
//        case "×": performOperation({(op1:Double, op2:Double) -> Double in
//            return op1 * op2})
//        case "×": performOperation({(op1, op2) in
//            return op1 * op2})
//        case "×": performOperation({(op1, op2) in
//             op1 * op2})
//        case "×": performOperation({$0 * $1})
//            case "×": performOperation(){$0 * $1}
            case "×": performOperation{$0 * $1}
        case "÷":performOperation{$1 / $0}
        case "√": sqrtOperation{sqrt($0)}
        default: break
        }
    }
    
    func performOperation(operation:(Double, Double) -> Double)
    {
        if operandStack.count >= 2 {
        displayvalue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func sqrtOperation(operation: Double -> Double)
    {
        if operandStack.count >= 2 {
            displayvalue = operation(operandStack.removeLast())
            enter()
        }
    }
    
//    func multiply(op1:Double, op2:Double) -> Double {
//    return op1 * op2
//    }
    
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

