//
//  DetailPresenter.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class DetailPresenter: NSObject, DetailPresenterInterface {
    
    var detailView : DetailViewInterface!
    var detailWireframe : DetailWireframe!
    var detailInteractor : DetailInteractorInput!

    func makeNetworkRequestForForks(forkUrl: String, type: QueryType){
        detailInteractor.sendNetworkRequest(forkUrl: forkUrl, type: type)
        
        if type == .firstQuery{
            detailWireframe.showLoadingIndicator()
        }

    }

    func forkOwnersArrayToShow(items: [ForkOwner]) {
        if items.count > 0{
            detailView.showForkOwners(items: items)
        }
        
        detailWireframe.hideLoadingIndicator()
    }

    func forkOwnersArrayToAppend(items: [ForkOwner]) {
        if items.count > 0{
            detailView.appendForkOwners(items: items)
        }
    }

    func setDetailViewTitle(repositoryName: String){
        detailView.setTitle(repositoryName: repositoryName)
    }
    
    func showErrorAlert(error: String){
        detailWireframe.showAlertView(error: error)
    }

}
