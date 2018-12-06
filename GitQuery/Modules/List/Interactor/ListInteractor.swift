//
//  ListInteractor.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import Alamofire

class ListInteractor: NSObject, ListInteractorInput {

    let networkManager = ListNetworkManager()

    func sendNetworkRequest(query: String) {

        networkManager.networkRequestWithQuery(query: query, completion: {response in
            //print(response)
            print(self.fromJsonToModel(jsonArray: response))
        })
    }
    
    func fromJsonToModel(jsonArray: NSArray) -> [RepositoryItem] {
        
        var repositoryItems = [RepositoryItem]()
        
        for i in 0..<jsonArray.count {
            
            let item = jsonArray.object(at: i) as! NSDictionary
            let owner = item["owner"] as! NSDictionary
            
            let repositoryItem = RepositoryItem(avatarUrl: owner["avatar_url"] as! String,
                                                repositoryName: item["name"] as! String,
                                                description: item["description"] as? String ?? "",
                                                forks: item["forks"] as! NSNumber,
                                                forksUrl: item["forks_url"] as! String,
                                                watchers: item["watchers"] as! NSNumber,
                                                stars: item["stargazers_count"] as! NSNumber)
            
            repositoryItems.append(repositoryItem)
        }

        return repositoryItems
    }
}
