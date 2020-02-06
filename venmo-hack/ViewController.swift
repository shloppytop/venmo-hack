//
//  ViewController.swift
//  venmo-hack
//
//  Created by Daniel Jones on 10/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit
import Parse
import SCLAlertView

class ViewController: UIViewController {
    private var venmoMarketings: [VenmoMarketingParse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVenmoMarketing()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterFromForeground), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    private func loadVenmoMarketing() {
        let query = VenmoMarketingParse.query() as! PFQuery<VenmoMarketingParse>
        query.whereKey("hasSent", equalTo: false)
        query.findObjectsInBackground { (venmoMarketings, error) in
            if let venmoMarketings = venmoMarketings {
                if venmoMarketings.isEmpty {
                    let alertView = SCLAlertView()
                    alertView.showInfo("None Left",
                                       subTitle: "There are no venmo's left that have not been sent.")
                } else {
                    self.venmoMarketings = venmoMarketings
                    self.didEnterFromForeground()
                }
            }
        }
    }
    
    @objc private func didEnterFromForeground() {
        if let venmoMarketing = venmoMarketings.first {
            Venmo.goToApp(with: venmoMarketing.venmoUsername, firstName: venmoMarketing.firstName)
            venmoMarketing.hasSent = true
            venmoMarketing.saveInBackground()
            venmoMarketings.removeFirst()
        } else {
            let alertView = SCLAlertView()
            alertView.showWarning("Reload more venmos",
                                  subTitle: "You have gone through 100 venmo's. Please kill the app and restart it to load more.")
        }
    }
}

