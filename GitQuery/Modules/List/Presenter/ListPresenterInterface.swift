//
//  ListPresenterInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

protocol ListPresenterInterface {
    func searchQuery(query: String, type: QueryType)
    func repositoryItemsArrayToShow(items: [RepositoryItem])
    func repositoryItemsArrayToAppend(items: [RepositoryItem])
    func showDetail(forkUrl: String, repositoryName: String)
    func showLogin()
    func showErrorAlert(error: String)
}
