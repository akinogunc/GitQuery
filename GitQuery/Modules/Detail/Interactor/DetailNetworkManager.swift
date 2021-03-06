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

    var currentPage = 1
    var forkUrl = "" //we need to save the url on the first query for pagination
    
    func networkRequestWithUrl(url: String, type: QueryType, completion: @escaping (ConnectionResult) -> Void){
        
        if type == QueryType.firstQuery{
            currentPage = 1
            forkUrl = url
        }else{
            currentPage += 1
        }

        let urlWithPagination = forkUrl + "?page=\(currentPage)" + "&per_page=50"

        Alamofire.request(urlWithPagination).responseJSON { response in
            
            switch response.result {
            case .success:
                
                if let result = response.result.value {
                    
                    if (response.response?.statusCode)! > 400{// 401 Unauthorized, 403 Forbidden(Rate limit)
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
