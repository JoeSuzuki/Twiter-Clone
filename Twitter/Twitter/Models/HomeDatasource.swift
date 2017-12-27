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
        let joeUser = User(name: "Test", username: "@Test", bioText: "Test Test Test Test", profileImage: #imageLiteral(resourceName: "IMG_3557"))
        
        let tomUser = User(name: "Test", username: "@Test", bioText: "Test Test Test Test", profileImage: #imageLiteral(resourceName: "IMG_3557"))
        
        return [joeUser, tomUser]
    }()
        
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}

