//
//  RepositoryItem.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

struct RepositoryItem {
    let avatarUrl : String
    let repositoryName : String
    let description : String
    let forks : NSNumber
    let forksUrl : String
    let watchers : NSNumber
    let stars : NSNumber

    init(avatarUrl : String, repositoryName : String, description : String, forks : NSNumber, forksUrl : String, watchers : NSNumber, stars : NSNumber) {
        
        self.avatarUrl = avatarUrl
        self.repositoryName = repositoryName
        self.description = description
        self.forks = forks
        self.forksUrl = forksUrl
        self.watchers = watchers
        self.stars = stars
    }
}
