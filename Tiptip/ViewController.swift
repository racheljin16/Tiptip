//
//  ViewController.swift
//  Tiptip
//
//  Created by Rachel Jin on 6/19/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var resultPosLow : CGFloat!
    var segmentPosLow: CGFloat!
 
    @IBOutlet weak var clearButton: UIButton!
    @IBAction func clearNumber(sender: UIButton) {
        billField.text = "$"
        taxLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        clearButton.hidden = true
        hintLabel.hidden = false
        UIView.animateWithDuration(0.7, delay: 0.1, options: .CurveEaseIn, animations: {
            var resultFrame = self.resultsView.frame
            resultFrame.origin.y = self.resultPosLow
            self.resultsView.frame = resultFrame
            self.resultsView.alpha = 0.0
            }, completion: { finished in
                print("results move down!")
        })

    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //clearButton.setImage(UIImage(named: "clear.png"), forState: UIControlState.Normal)
        billField.text = "$"
        taxLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        clearButton.hidden = true
        hintLabel.hidden = false
        resultsView.alpha = 0.0
        resultPosLow = resultsView.frame.midY
        segmentPosLow = tipControl.frame.midY
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        if billField.text == "$" {
            UIView.animateWithDuration(0.7, delay: 0.1, options: .CurveEaseIn, animations: {
                var resultFrame = self.resultsView.frame
                resultFrame.origin.y = self.resultPosLow
                self.resultsView.frame = resultFrame
                self.resultsView.alpha = 0.0
                }, completion: { finished in
                    print("results move down!")
            })

        } else {
            clearButton.hidden = false
            hintLabel.hidden = true
            let tipPercentages = [0.15, 0.18, 0.2]
            let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            let billAmount = Double(NSString(string:billField.text!).substringFromIndex(1))
            let tax = billAmount! * 0.0875
            let tip = billAmount! * tipPercentage
            let total = billAmount! + tip + tax

            taxLabel.text = String(format:"$%.2f", tax)
            tipLabel.text = String(format:"$%.2f", tip)
            totalLabel.text = String(format:"$%.2f", total)
            UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
                var resultFrame = self.resultsView.frame
                resultFrame.origin.y = 150
                self.resultsView.frame = resultFrame
                self.resultsView.alpha = 1.0
                }, completion: { finished in
                    print("results move up!")
            })
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    

}

