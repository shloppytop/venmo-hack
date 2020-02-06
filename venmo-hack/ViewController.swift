//
//  ViewController.swift
//  venmo-hack
//
//  Created by Daniel Jones on 10/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterFromForeground), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    @objc private func didEnterFromForeground() {
        Venmo.goToApp(with: "c-reeder", firstName: "hii")
    }
}

