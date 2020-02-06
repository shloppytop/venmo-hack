//
//  AppDelegate.swift
//  venmo-hack
//
//  Created by Daniel Jones on 10/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "btownRidesDevelopment43598903845902UFSF"
            $0.server = "https://btown-rides-development.herokuapp.com/parse"
        }
        
        Parse.initialize(with: parseConfig)
        // Override point for customization after application launch.
        return true
    }
}

