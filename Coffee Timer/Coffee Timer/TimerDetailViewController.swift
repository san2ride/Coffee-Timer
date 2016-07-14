//
//  TimerDetailViewController.swift
//  Coffee Timer
//
//  Created by don't touch me on 7/13/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit



class TimerDetailViewController: UIViewController {
    
    
    @IBOutlet weak var durationLabel: UILabel!
    
    
    var timerModel: TimerModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        durationLabel.text = "\(timerModel.duration / 60) min \(timerModel.duration % 60 ) sec"
        
        title = timerModel.coffeeName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     

}
