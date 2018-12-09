//
//  DetailViewInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

protocol DetailViewInterface {
    func showForkOwners(items: [ForkOwner])
    func appendForkOwners(items: [ForkOwner])
    func setTitle(repositoryName: String)
}
