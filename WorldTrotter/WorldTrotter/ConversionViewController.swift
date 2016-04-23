//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Shena Yoshida on 4/22/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

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
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
//            celsiusLabel.text = "\(value)"
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
