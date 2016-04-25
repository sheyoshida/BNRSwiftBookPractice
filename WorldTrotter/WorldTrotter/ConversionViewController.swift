//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Shena Yoshida on 4/22/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate { // conform to delegate, declare protocol

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet { // property observer is called whenever value changes
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        
        let nf = NSNumberFormatter() // format number
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }() // adding closure to instantiate number formatter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Conversion View Controller loaded its view.")
        
    }
    
    // silver challenge - make background color change based on time of day
    override func viewWillAppear(animated: Bool) {
        
        // get the hour using NSCalendar
        let hour = NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: NSDate())
        
        let myColor: UIColor
        
                switch hour {
                case 1...6:
                    myColor = UIColor.purpleColor()
                case 7...12:
                    myColor = UIColor.redColor()
                case 13...18:
                    myColor = UIColor.greenColor()
                case 19...24:
                    myColor = UIColor.yellowColor()
                default:
                    myColor = UIColor.lightGrayColor()
                }
        
        view.backgroundColor = myColor

    }
    
    // built in delegate method to prevent adding multiple decimal separators
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        let letterCharacters = NSCharacterSet.letterCharacterSet() // disallow letters
        
        if string.lowercaseString.rangeOfCharacterFromSet(letterCharacters) != nil {
            return false
        }
        else {
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                return false
            }
            else {
                return true
            }
        }
    }
    
    func updateCelsiusLabel() {
        
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    

    
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    

    

}
