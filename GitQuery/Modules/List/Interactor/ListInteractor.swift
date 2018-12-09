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

    var listPresenter : ListPresenterInterface!
    let networkManager = ListNetworkManager()

    func sendNetworkRequest(query: String, type: QueryType) {
        networkManager.networkRequestWithQuery(query: query, type: type, completion: {connectionResult in
            
            switch connectionResult {
            case .success(let response):
                
                if type == QueryType.firstQuery{
                    self.listPresenter?.repositoryItemsArrayToShow(items: self.fromJsonToRepositoryItems(jsonArray: response))
                }else{
                    self.listPresenter?.repositoryItemsArrayToAppend(items: self.fromJsonToRepositoryItems(jsonArray: response))
                }
                
            case .failure(let error):
                self.listPresenter.showErrorAlert(error: error)
            }

        })
    }
    
    func prepareRetrievedRepositories(repos: NSArray) {
        self.listPresenter?.repositoryItemsArrayToShow(items: self.fromJsonToRepositoryItems(jsonArray: repos))
    }
    
    func fromJsonToRepositoryItems(jsonArray: NSArray) -> [RepositoryItem] {
        
        var repositoryItems = [RepositoryItem]()
        
        for i in 0..<jsonArray.count {
            
            let item = jsonArray.object(at: i) as! NSDictionary
            let owner = item["owner"] as! NSDictionary
            
            let repositoryItem = RepositoryItem(avatarUrl: owner["avatar_url"] as! String,
                                                repositoryName: item["name"] as! String,
                                                description: item["description"] as? String ?? "No Description",
                                                forks: item["forks"] as! NSNumber,
                                                forksUrl: item["forks_url"] as! String,
                                                watchers: item["watchers"] as! NSNumber,
                                                stars: item["stargazers_count"] as! NSNumber)
            
            repositoryItems.append(repositoryItem)
        }

        return repositoryItems
    }
}
