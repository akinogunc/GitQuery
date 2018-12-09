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
    
    func loginAndGetRepositories(credentials: Credential, completion: @escaping (ConnectionResult) -> Void){
        
        let url = "https://api.github.com/user/repos"
        let credential = credentials.username + ":" + credentials.password
        let headers = ["Authorization": "Basic \(credential.base64String())"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in

            switch response.result {
            case .success:
                
                if let result = response.result.value {
                    
                    if (response.response?.statusCode)! > 400{// 401 Unauthorized, 403 Forbidden
                        let resultDict = result as! NSDictionary
                        completion(.failure(resultDict["message"] as! String))
                    }else{
                        completion(.success(result as? NSArray ?? NSArray()))
                    }
                    
                }
                
            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }

        }
    }
        
}
