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
            display.text = num
        }else
        {
            display.text = display.text! + num
        }
    }
    
    @IBAction func enter(sender: UIButton) {
        
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

