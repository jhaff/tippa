//
//  ViewController.swift
//  tippa
//
//  Created by Jacob Haff on 6/26/20.
//  Copyright © 2020 Jacob Haff. All rights reserved.
//

import UIKit

class CalcuatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var billAndTip = 0.0
    var splitBill = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        //Deselect all tip buttons via IBOutlets
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //Make the button that triggered the IBAction selected.
        sender.isSelected = true
        
        //Get current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String from an array.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value) - 1)
    }
    	
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        
        var bill = 0.0
        
        if let billText = billTextField.text {
            bill = Double(billText) ?? 0.0
        }
        
        billAndTip = bill + (bill * tip)
        
        if let splitNum = Double(splitNumberLabel.text ?? "1") {
            splitBill = billAndTip / splitNum
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = splitBill
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = splitNumberLabel.text ?? ""
        }
    }
}

