//
//  DetailInteractor.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class DetailInteractor: NSObject, DetailInteractorInput {
    
    var detailPresenter : DetailPresenterInterface!
    let networkManager = DetailNetworkManager()

    func sendNetworkRequest(forkUrl: String, type: QueryType) {
        
        networkManager.networkRequestWithUrl(url: forkUrl, type: type, completion: {connectionResult in
            
            switch connectionResult {
            case .success(let response):
                
                if type == QueryType.firstQuery{
                    self.detailPresenter.forkOwnersArrayToShow(items: self.fromJsonToForkOwners(jsonArray: response))
                }else{
                    self.detailPresenter.forkOwnersArrayToAppend(items: self.fromJsonToForkOwners(jsonArray: response))
                }

            case .failure(let error):
                self.detailPresenter.showErrorAlert(error: error)
            }

        })

    }
    
    func fromJsonToForkOwners(jsonArray: NSArray) -> [ForkOwner] {
        
        var forkOwners = [ForkOwner]()
        
        for i in 0..<jsonArray.count {
            
            let item = jsonArray.object(at: i) as! NSDictionary
            let owner = item["owner"] as! NSDictionary
            
            let forkOwner = ForkOwner(avatarUrl: owner["avatar_url"] as! String, loginName: owner["login"] as! String)
            forkOwners.append(forkOwner)
        }
        
        return forkOwners
    }

}
