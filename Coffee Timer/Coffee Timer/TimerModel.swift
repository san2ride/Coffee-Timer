//
//  TimerModel.swift
//  Coffee Timer
//
//  Created by don't touch me on 7/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import Foundation

class TimerModel: NSObject {
    
    var name = ""
    var duration = 0
    var type = TimerType.coffee
    
    enum TimerType {
        case coffee
        case tea
    }
    
    init(name: String, duration: Int, type: TimerType) {
        self.name = name
        self.duration = duration
        self.type = type
        super.init()
    }
    
    override var description: String {
        return "TimerModel(\(name))"
    }
    
    

}
