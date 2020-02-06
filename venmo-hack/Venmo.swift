//
//  Venmo.swift
//  venmo-hack
//
//  Created by Daniel Jones on 10/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import UIKit

class Venmo {
    static func goToApp(with username: String, firstName: String) {
        let price = 0.01
        let venmoBody = createQuote(firstName: firstName)
        let urlString = "venmo://paycharge?txn=pay&recipients=\(username)&amount=\(price)&note=\(venmoBody)"
        
        if let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("an't open Venmo. You need to have the Venmo app installed to open venmo")
            }
        }
    }
    
    private static func createQuote(firstName: String) -> String {
        let introQuote = "Hey \(firstName), you're now a pennyaire!💸💸💸\n\nIt's time to treat yourself to the most 🥰🥳🤩 rideshare service in Champaign Urbana! Nomad Rides gives $5.50 rides anywhere on University of Illinois's campus."
        let endQuote = "\n\nDownload Nomad Rides on the app store: http://bit.ly/nomadRides"
        return introQuote + endQuote
    }
}
