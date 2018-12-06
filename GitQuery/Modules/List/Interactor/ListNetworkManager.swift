//
//  ListNetworkManager.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import Alamofire

class ListNetworkManager: NSObject {

    func networkRequestWithQuery(query: String, completion: @escaping (NSArray) -> Void){
        
        let url = "https://api.github.com/search/repositories?q=" + query + "&page=1" + "&per_page=20"
        
        Alamofire.request(url).responseJSON { response in
            
            if let result = response.result.value {
                let json = result as! [String : Any]
                completion(json["items"] as! NSArray)
            }

        }
    }
}

