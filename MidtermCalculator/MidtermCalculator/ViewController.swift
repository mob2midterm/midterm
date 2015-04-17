//
//  ViewController.swift
//  MidtermCalculator
//
//  Created by Pete Nellius on 4/16/15.
//  Copyright (c) 2015 Pete Nellius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userTypingNumber = false
    var firstNum: Float = 0
    var secondNum: Float = 0
    var desiredOperator = ""
    
    
    @IBOutlet weak var displayNum: UILabel!

    
    
    @IBAction func operatorTapped(sender: UIButton) {
        
        userTypingNumber = false
        firstNum = (displayNum.text! as NSString).floatValue
        desiredOperator = sender.currentTitle!
    }
    
    @IBAction func calcPercentage(sender: UIButton) {
        var percent = (displayNum.text! as NSString).floatValue
        var result: Float = percent / 100
        displayNum.text = "\(result)"
    }
    
    @IBAction func positiveNegativeButton(sender: AnyObject) {
        
        var posNeg = displayNum.text!.toInt()!
        var result = posNeg * -1
        
        displayNum.text = String(result)
        
    }
    
    
    @IBAction func clearButton(sender: UIButton) {
        
        var clearDisplay = (displayNum.text! as NSString).floatValue
        var result: Float = clearDisplay * 0
        displayNum.text = "0"
    }


    
    @IBAction func equalTapped(sender: AnyObject) {
        
        userTypingNumber = false
        var result: Float = 0
        secondNum = (displayNum.text! as NSString).floatValue
        
        if desiredOperator == "+" {
            result = firstNum + secondNum
        } else if desiredOperator == "-" {
            result = firstNum - secondNum
        } else if desiredOperator == "X" {
            result = firstNum * secondNum
        } else if desiredOperator == "/" {
            result = firstNum / secondNum
        }
        displayNum.text = "\(result)"
    }
    
    @IBAction func numberTapped(sender: UIButton) {
        var number = sender.currentTitle
        
        if userTypingNumber == true {displayNum.text = displayNum.text! + number!
        } else {
            displayNum.text = number!
            userTypingNumber = true

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