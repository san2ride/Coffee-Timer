//
//  TimerEditViewController.swift
//  Coffee Timer
//
//  Created by don't touch me on 7/29/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

    @objc protocol TimerEditViewControllerDelegate {
        func timerEditViewControllerDidCancel(_ viewController: TimerEditViewController)
        func timerEditViewControllerDidSave(_ viewController: TimerEditViewController)
}

class TimerEditViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var minutesSlider: UISlider!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var secondsSlider: UISlider!
    
    
    var creatingNewTimer = false
    weak var delegate: TimerEditViewControllerDelegate?
    var timerModel: TimerModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfMinutes = Int(timerModel.duration / 60)
        let numberOfSeconds = timerModel.duration % 60
        nameField.text = timerModel.name
        updateLabelsWithMinutes(numberOfMinutes, seconds: numberOfSeconds)
        minutesSlider.value = Float(numberOfMinutes)
        secondsSlider.value = Float(numberOfSeconds)
        
        switch timerModel.type {
        case .coffee:
            timerTypeSegmentedControl.selectedSegmentIndex = 0
        case .tea:
            timerTypeSegmentedControl.selectedSegmentIndex = 1
        }

    }

    @IBAction func cancelWasPressed(_ sender: UIBarButtonItem) {
        delegate?.timerEditViewControllerDidCancel(self)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneWasPressed(_ sender: UIBarButtonItem) {
        timerModel.name = nameField.text!
        timerModel.duration = Int(minutesSlider.value) * 60 + Int(secondsSlider.value)
        
        if timerTypeSegmentedControl.selectedSegmentIndex == 0 {
            timerModel.type = .coffee
        } else { // must be 1
            timerModel.type = .tea
        }
        
        delegate?.timerEditViewControllerDidSave(self)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let numberOfMinutes = Int(minutesSlider.value)
        let numberOfSeconds = Int(secondsSlider.value)
        updateLabelsWithMinutes(numberOfMinutes, seconds: numberOfSeconds)
        
    }
    
    @IBOutlet weak var timerTypeSegmentedControl: UISegmentedControl!
    
    
    func updateLabelsWithMinutes(_ minutes: Int, seconds: Int) {
        func pluralize(_ value: Int, singular: String, plural: String) -> String {
            switch value {
            case 1:
                return "1 \(singular)"
            case let pluralValue:
                return "\(pluralValue) \(plural)"
            }
        }
        
        minutesLabel.text = pluralize(minutes,singular: "minute", plural: "minutes")
        secondsLabel.text = pluralize(seconds, singular: "second", plural: "seconds")
    }
    
    
    
    
   
}
