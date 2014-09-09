//
//  SettingViewController.swift
//  tip
//
//  Created by Li Yu on 9/8/14.
//  Copyright (c) 2014 Li Yu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    

    @IBOutlet weak var tipSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonOnTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {

        var tipIndex = tipSegmentControl.selectedSegmentIndex
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipSegmentControl.selectedSegmentIndex, forKey: "tipIndex")
        defaults.synchronize()
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue : Int? = defaults.integerForKey("tipIndex")
        if let segIndex : Int = intValue {
            tipSegmentControl.selectedSegmentIndex = segIndex
        } else {
            tipSegmentControl.selectedSegmentIndex = 0
        }

        
        super.viewWillAppear(animated)
        println("view did appear")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
