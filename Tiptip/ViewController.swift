//
//  ViewController.swift
//  Tiptip
//
//  Created by Rachel Jin on 6/19/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = "$"
        taxLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = Double(NSString(string:billField.text!).substringFromIndex(1))
        let tax = billAmount! * 0.0875
        let tip = billAmount! * tipPercentage
        let total = billAmount! + tip + tax

        taxLabel.text = String(format:"$%.2f", tax)
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    

}

