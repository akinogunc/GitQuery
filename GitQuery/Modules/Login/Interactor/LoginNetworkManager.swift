//
//  LoginNetworkManager.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import Alamofire

class LoginNetworkManager: NSObject {
    
    func loginAndGetRepositories(credentials: Credential, completion: @escaping (NSArray) -> Void){
        
        let url = "https://api.github.com/user/repos"
        let credential = credentials.username + ":" + credentials.password
        let headers = ["Authorization": "Basic \(base64String(credential: credential))"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let result = response.result.value {
                completion(result as! NSArray)
            }

        }
    }
    
    func base64String(credential: String) -> String {
        let data = credential.data(using: String.Encoding.utf8)
        let base64 = data!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        return base64
    }
}
