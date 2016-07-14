//
//  ViewController.swift
//  Coffee Timer
//
//  Created by don't touch me on 7/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var timerModel: TimerModel! {
        willSet(newModel) {
            print("about to change model to \(newModel)")
        }
        
        didSet {
            print("set model to \(timerModel)")
            updateUserInterface()
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func setupModel() {
        self.timerModel = TimerModel(coffeeName: "Colombian Coffee", duration: 240)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view is loaded")
        
        setupModel()
        title = "Root"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUserInterface() {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("preparing for segue with identifier:\(segue.identifier)")
        
        if segue.identifier == "pushDetail" {
            let viewController = segue.destinationViewController as! TimerDetailViewController
            viewController.timerModel = timerModel
        }
        
    }


}

