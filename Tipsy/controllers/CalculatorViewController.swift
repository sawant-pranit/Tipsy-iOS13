//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip : Double = 0.1
    var splitBetween = 2
    
    var result : String = "0.0"
    

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        print("TIP \(tip)")
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitBetween = Int(sender.value)
        splitNumberLabel.text = String(splitBetween)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("Split: \(splitBetween)")
        let billAmount = Double(billTextField.text!)!
        let calculatedTipValue = billAmount * (tip)
        let splitValue = calculatedTipValue / Double(splitBetween)
        result = String(format: "%.2f", splitValue)
        print("Calculated: \(splitValue)")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = result
        }
        
    }
    
}

