//
//  ViewController.swift
//  venmo-hack
//
//  Created by Daniel Jones on 10/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var venmoUsers: 
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterFromForeground), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    @objc private func didEnterFromForeground() {
        let username = venmoNames[0]
        
        Venmo.goToApp(with: "Jeremy-Mullins-2")
    }
}

