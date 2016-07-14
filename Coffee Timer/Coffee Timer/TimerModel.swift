//
//  TimerModel.swift
//  Coffee Timer
//
//  Created by don't touch me on 7/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import Foundation

class TimerModel: NSObject {
    
    var coffeeName = ""
    var duration = 0
    
    init(coffeeName: String, duration: Int) {
        self.coffeeName = coffeeName
        self.duration = duration
        super.init()
    }
    
    override var description: String {
        get {
            return "TimerModel(\(coffeeName))"
        }
    }

}
