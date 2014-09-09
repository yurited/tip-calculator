//
//  ViewController.swift
//  tip
//
//  Created by Li Yu on 9/2/14.
//  Copyright (c) 2014 Li Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    func updateValues() {
        var tipPercentages = [0.15, 0.2, 0.23]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var bill = NSString (string: billField.text).doubleValue
        var tip = bill * tipPercentage
        var total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }
                            
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateValues()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(sender: AnyObject) {
        self.view.endEditing(true)
    }

    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("tipIndex")
        tipControl.selectedSegmentIndex = intValue
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }

    
    
}

