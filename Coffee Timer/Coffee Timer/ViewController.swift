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
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressiveView: UIProgressView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view is loaded")
        view.backgroundColor = .orangeColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonWasPressed(sender: AnyObject) {
        print("button was pressed")
        
        let date = NSDate()
        
        label.text = "button was pressed at \(date)"
        
    }
 
    @IBAction func sliderValueChanged(sender: AnyObject) {
        print("slider value changed to \(self.slider.value)")
        
        progressiveView.progress = slider.value
        
        
    }

}

