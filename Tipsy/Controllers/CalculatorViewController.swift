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
    @IBOutlet weak var zeroPCTButton: UIButton!
    @IBOutlet weak var tenPCTButton: UIButton!
    @IBOutlet weak var twentyPCTButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipPercentage = 0.1
    var totalBill = 0.0
    var totalBillPerPerson = 0.0
    var totalPersonToSplitBetween = 2.0
    

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPCTButton.isSelected = false
        tenPCTButton.isSelected = false
        twentyPCTButton.isSelected = false
        if sender.currentTitle! == "0%" {
            zeroPCTButton.isSelected = true
            tipPercentage = 0.0
        } else if sender.currentTitle! == "10%" {
            tenPCTButton.isSelected = true
            tipPercentage = 0.1
        } else if sender.currentTitle! == "20%" {
            twentyPCTButton.isSelected = true
            tipPercentage = 0.2
        }
        let bill = billTextField.text
        if bill != nil{
        totalBill = (Double(bill!)!)*(1 + tipPercentage)
        }
        billTextField.endEditing(true)
        totalBillPerPerson = totalBill/totalPersonToSplitBetween
    }
  
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        totalPersonToSplitBetween = sender.value
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultScreen = segue.destination as! ResultsViewController
            resultScreen.total = String(format:"%.2f", totalBillPerPerson)
            print(totalBillPerPerson)
            resultScreen.totalNumberOFPeople = totalPersonToSplitBetween
            resultScreen.tipPaid = tipPercentage
        }
    }
    
}

