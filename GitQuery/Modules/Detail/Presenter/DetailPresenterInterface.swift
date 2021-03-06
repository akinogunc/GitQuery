//
//  DetailPresenterInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

protocol DetailPresenterInterface {
    func forkOwnersArrayToShow(items: [ForkOwner])
    func forkOwnersArrayToAppend(items: [ForkOwner])
    func showErrorAlert(error: String)
    func makeNetworkRequestForForks(forkUrl: String, type: QueryType)
}
