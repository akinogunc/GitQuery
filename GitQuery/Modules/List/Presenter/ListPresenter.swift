//
//  ListPresenter.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class ListPresenter: NSObject, ListPresenterInterface {

    var listView : ListViewInterface!
    var listWireframe : ListWireframe!
    var listInteractor : ListInteractorInput!

    func searchQuery(query: String){
        listInteractor.sendNetworkRequest(query: query)
    }

    func repositoryItemsArrayFromQuery(items: [RepositoryItem]){
        listView.showRepositoryItems(items: items)
    }
    
    func showDetail(forkUrl: String, repositoryName: String) {
        listWireframe.pushDetailView(forkUrl: forkUrl, repositoryName: repositoryName)
    }
}
