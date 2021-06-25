//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var currentTip = 0.0
    var split = 0
    var result = 0.0


    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.currentTitle {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            currentTip = 0.0
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            currentTip = 0.1
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            currentTip = 0.2
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            currentTip = 0.0
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.maximumValue = 12
        sender.minimumValue = 0
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        split = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            let billAmount = Double(bill)!
            result = billAmount * Double(1 + currentTip) / Double(split)
            print(String(format: "%.2f", result))
            
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.tip = (currentTip * 100)
            destinationVC.numberOfPeople = split
            destinationVC.totalPerPerson = result
        }
    }
    
}

