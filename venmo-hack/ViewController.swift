//
//  ViewController.swift
//  venmo-hack
//
//  Created by Daniel Jones on 10/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    private var venmoMarketings: [VenmoMarketingParse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterFromForeground), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    private func loadVenmoMarketing() {
        var query = VenmoMarketingParse.query() as! PFQuery<VenmoMarketingParse>
        query.whereKey("hasSent", equalTo: false)
        query.findObjectsInBackground { (venmoMarketings, error) in
            if let venmoMarketings = venmoMarketings {
                self.venmoMarketings = venmoMarketings
                
                if venmoMarketings.isEmpty {
                    
                }
            }
        }
    }
    
    @objc private func didEnterFromForeground() {
        Venmo.goToApp(with: "c-reeder", firstName: "hii")
    }
}

