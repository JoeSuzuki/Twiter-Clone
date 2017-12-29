//
//  Service.swift
//  Twitter
//
//  Created by Joe Suzuki on 12/29/17.
//  Copyright © 2017 Joe Suzuki. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        let request: APIRequest<HomeDatasource,JSONError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Success in fetching JSON objects")
            print(homeDatasource.users.count)
            
            completion(homeDatasource)
            
        }) { (err) in
            print("Failed to fetch JSON objects", err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
}
