//
//  LoginInteractorInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    func sendNetworkRequest(credentials: Credential, remember: Bool)
    func getCredentials() -> Credential
}
