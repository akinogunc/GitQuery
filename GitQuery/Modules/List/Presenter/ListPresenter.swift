//
//  ListPresenter.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class ListPresenter: NSObject, ListPresenterInterface, LoginModuleDelegate {

    var listView : ListViewInterface!
    var listWireframe : ListWireframe!
    var listInteractor : ListInteractorInput!

    func searchQuery(query: String, type: QueryType){
        listInteractor.sendNetworkRequest(query: query, type: type)
        
        if type == .firstQuery{
            listWireframe.showLoadingIndicator()
        }
    }

    func repositoryItemsArrayToShow(items: [RepositoryItem]){
        
        if items.count == 0{
            listWireframe.showNoResultAlert()
            listView.clearRepositoryData()
        }else{
            listView.showRepositoryItems(items: items)
        }
        
        listWireframe.hideLoadingIndicator()
    }
    
    func repositoryItemsArrayToAppend(items: [RepositoryItem]){
        
        if items.count>0{
            listView.appendRepositoryItems(items: items)
        }
    }

    func showDetail(forkUrl: String, repositoryName: String) {
        listWireframe.pushDetailView(forkUrl: forkUrl, repositoryName: repositoryName)
    }
    
    func showLogin() {
        listWireframe.presentLoginView()
    }
    
    func loggedInAndRetrievedRepositories(repos: NSArray){
        listInteractor.prepareRetrievedRepositories(repos: repos)
    }
    
    func showErrorAlert(error: String){
        listWireframe.showAlertView(error: error)
    }
}
