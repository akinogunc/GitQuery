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

    var currentPage = 1
    
    func networkRequestWithQuery(query: String, type: QueryType, completion: @escaping (ConnectionResult) -> Void){
        
        if type == QueryType.firstQuery{
            currentPage = 1
        }else{
            currentPage += 1
        }
        
        let url = "https://api.github.com/search/repositories?q=" + query + "&page=\(currentPage)" + "&per_page=50"
        let escapedUrl = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)

        Alamofire.request(escapedUrl!).responseJSON { response in

            switch response.result {
            case .success:
                
                if let result = response.result.value {
                    
                    if (response.response?.statusCode)! > 400{// 401 Unauthorized, 403 Forbidden(Rate limit)
                        let resultDict = result as! NSDictionary
                        completion(.failure(resultDict["message"] as! String))
                    }else{
                        let json = result as! [String : Any]
                        let repositories = json["items"] as? NSArray ?? NSArray()
                        completion(.success(repositories))
                    }
                    
                }

            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }

        }
    }
    
}

