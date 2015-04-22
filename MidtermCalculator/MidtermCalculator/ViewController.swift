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
    var hasBeenCleared = false
    
    
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
        
        var posNeg = (displayNum.text! as NSString).floatValue
        var result = posNeg * -1
        
        displayNum.text = String(stringInterpolationSegment: result)
        
    }
    
    

    
    
    @IBAction func allClearButton(sender: AnyObject) {
        
//        if userTypingNumber == false || hasBeenCleared == true {
//            firstNum = 0
//            secondNum = 0
//            displayNum.text = "0"
//            println("All clear here!")
//            hasBeenCleared = false
//
//        } else {
//            displayNum.text = "0"
//            println("Just clearing the display")
//            println("firstNum is: \(firstNum), secondNum is: \(secondNum)")
//            hasBeenCleared == true
//        }
        
        if hasBeenCleared == false {
            displayNum.text = "0"
            println("Just clearing the display")
            println("firstNum is: \(firstNum), secondNum is: \(secondNum)")
            hasBeenCleared = true
            
        } else {
            firstNum = 0
            secondNum = 0
            displayNum.text = "0"
            println("All clear here!")
            hasBeenCleared = false
        }
        

        
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
        if let number = sender.currentTitle{
            
            if number == "." {
                displayNum.text = displayNum.text?.stringByReplacingOccurrencesOfString(".", withString: "")
            }
            
            if userTypingNumber == true {
                displayNum.text = displayNum.text! + number
            } else {
                displayNum.text = number
                userTypingNumber = true
                
            }
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