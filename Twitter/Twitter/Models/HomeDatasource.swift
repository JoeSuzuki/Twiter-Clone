//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Joe Suzuki on 12/26/17.
//  Copyright © 2017 Joe Suzuki. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
   
    let users: [User]
    
    required init(json: JSON) throws {
        var users = [User]()
        
        let array = json["users"].array
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        
        self.users = users
    }

    let tweets: [Tweet] = {
        let joeUser = User(name: "Test", username: "@Test", bioText: "Test Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest TestTest Test Test TestTest TestTest Test Test TestTest TestTest Test Test Test", profileImage: #imageLiteral(resourceName: "IMG_3557"))
        let tweet = Tweet(user: joeUser, message: "I wanna be richhhhhh Test Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest TestTest Test Test TestTest Test Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest TestTest Test Test TestTest ")
        let tweet2 = Tweet(user: joeUser, message: "I wanna be richhhhhh Test Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest TestTest Test Test TestTest Test Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest TestTest Test Test TestTest ")
        return [tweet, tweet2]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}

