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

    func makeNetworkRequestForForks(forkUrl: String){
        detailInteractor.sendNetworkRequest(forkUrl: forkUrl)
    }

    func forkOwnersArrayFromRequest(items: [ForkOwner]) {
        detailView.showForkOwners(items: items)
    }

    func setDetailViewTitle(repositoryName: String){
        detailView.setTitle(repositoryName: repositoryName)
    }
}
