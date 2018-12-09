//
//  ListViewInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

protocol ListViewInterface {
    func showRepositoryItems(items: [RepositoryItem])
    func appendRepositoryItems(items: [RepositoryItem])
}
