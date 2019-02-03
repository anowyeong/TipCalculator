//
//  ViewController.swift
//  TipCalcApp
//
//  Created by Anthony Owyeong on 1/30/19.
//  Copyright © 2019 Anthony Owyeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calcInputLbl: UITextField!
    @IBOutlet weak var taxAmount: UISegmentedControl!
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var totalAmtLbl: UILabel!
    @IBOutlet weak var totalAfterSplitLbl: UILabel!
    @IBOutlet weak var numAfterSplitLbl: UILabel!
   
    
    @IBAction func OnTap(_ sender: Any) {
        //exit keyboard
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        //Display number of people to split amongst
        let numOfPpl: Int = Int(amountSlider.value)
        numAfterSplitLbl.text = String(format:"Split: %d", numOfPpl)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func CalculateTip(_ sender: Any) {
        //Display number of people to split amongst and recall CalculateTip
        let numOfPpl: Int = Int(amountSlider.value)
        numAfterSplitLbl.text = String(format:"Split: %d", numOfPpl)
        
        //calculating Total:
        let bill = Double (calcInputLbl.text!) ?? 0
        let taxPercentages = [0.15, 0.20, 0.22]
        
        let tip = bill * taxPercentages[taxAmount.selectedSegmentIndex]
        let total = bill + tip
        totalAmtLbl.text = String (format: "$%.2f", total)
        
        //calculating Total After Splitting:
        let splitbill = total / Double(numOfPpl)
        
        totalAfterSplitLbl.text = String(format: "$%.2f", splitbill)
    }
    
}

