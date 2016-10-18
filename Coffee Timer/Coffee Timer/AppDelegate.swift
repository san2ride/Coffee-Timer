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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("application has launched")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("application has resigned active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("application has entered foreground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("application has entered foreground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("application has become active")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("application will trminate")
    }


}

