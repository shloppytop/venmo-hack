//
//  VenmoMarketing.swift
//  venmo-hack
//
//  Created by Daniel Jones on 2/6/20.
//  Copyright © 2020 Chong500Productions. All rights reserved.
//

import Foundation

import Parse

class VenmoMarketingParse: PFObject, PFSubclassing {
    struct Constants {
        static let driver = "driver"
        static let driver_user = "driver.user"
    }
    
    class func parseClassName() -> String {
        return "VenmoMarketing"
    }
    
    @NSManaged var firstName: String
    @NSManaged var hasSent: Bool
    @NSManaged var venmoUsername: String
}
