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
    static func goToApp(with username: String) {
        let price = 0.01
        let venmoBody = createQuote()
        let urlString = "venmo://paycharge?txn=pay&recipients=\(username)&amount=\(price)&note=\(venmoBody)"
        
        if let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("an't open Venmo. You need to have the Venmo app installed to open venmo")
            }
        }
    }
    
    private static func createQuote() -> String {
        let introQuote = "Nomad Rides gives $5 rides anywhere on IU's campus. But, we also play the most 🔥🔥🔥 beats in our cars:\n\n"
        let songQuote = "Hey, I just 🙋‍♀️you\nAnd this is 😱\nBut here’s my 📲\nSo 📞 me, maybe?\n\nIt’s hard to 👀 right\nat you 👶\nBut here’s my 🔢\nSo ☎️ me, maybe❓\n\nYour 😍 was holdin’\nRipped 👖,\nskin was showin’\n🔥\nnight, wind was 💨\nWhere you think\nyou’re going 👶?\n\nAnd all the other\n👨‍⚖️👨‍✈️👨‍🚒👨🏾‍🔬🧛‍♂️🧙🏻‍♂️\ntry to 🏃‍♂️ me\nBut here’s\nmy 📲\nSo ☎️ me, maybe?"
        let endQuote = "\n\nNow that you're a pennyaire, download Nomad Rides on the app store 😉"
        return introQuote + songQuote + endQuote
    }
}
