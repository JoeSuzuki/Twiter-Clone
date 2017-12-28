//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Joe Suzuki on 12/26/17.
//  Copyright © 2017 Joe Suzuki. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
   
    let users: [User] = {
        let joeUser = User(name: "Test", username: "@Test", bioText: "Test Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest TestTest Test Test TestTest TestTest Test Test TestTest TestTest Test Test Test", profileImage: #imageLiteral(resourceName: "IMG_3557"))
        
        let tomUser = User(name: "Test", username: "@Test", bioText: "Test Test Test Test", profileImage: #imageLiteral(resourceName: "IMG_3557"))
        
        let timUser = User(name: "Test", username: "@Test", bioText: "Test Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test TestTest Test Test Test", profileImage: #imageLiteral(resourceName: "IMG_3557"))
        return [joeUser, tomUser, timUser]
    }()
    
    let tweets = ["1", "2"]
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

