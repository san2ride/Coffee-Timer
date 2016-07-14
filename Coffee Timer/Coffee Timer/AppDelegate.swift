//
//  AppDelegate.swift
//  Coffee Timer
//
//  Created by don't touch me on 7/5/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print("application has launched")
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        print("application has resigned active")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        print("application has entered foreground")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        print("application has entered foreground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("application has become active")
    }

    func applicationWillTerminate(application: UIApplication) {
        print("application will trminate")
    }


}

