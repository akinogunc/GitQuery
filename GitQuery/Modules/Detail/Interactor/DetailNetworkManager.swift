//
//  DetailNetworkRequest.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import Alamofire

class DetailNetworkManager: NSObject {

    func networkRequestWithUrl(url: String, completion: @escaping (NSArray) -> Void){
        
        Alamofire.request(url).responseJSON { response in
            
            if let result = response.result.value {
                completion(result as! NSArray)
            }
            
        }
    }

}
