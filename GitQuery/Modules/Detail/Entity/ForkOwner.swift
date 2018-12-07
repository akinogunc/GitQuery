//
//  ForkOwner.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

struct ForkOwner {
    let avatarUrl : String
    let loginName : String
    
    init(avatarUrl : String, loginName : String) {
        
        self.avatarUrl = avatarUrl
        self.loginName = loginName
    }
}
