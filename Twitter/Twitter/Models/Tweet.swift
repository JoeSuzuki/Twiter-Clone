//
//  Tweet.swift
//  Twitter
//
//  Created by Joe Suzuki on 12/28/17.
//  Copyright © 2017 Joe Suzuki. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}

