//
//  Credential.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

struct Credential: Codable {
    var username: String
    var password: String
    
    init(username : String, password : String) {
        self.username = username
        self.password = password
    }

}
