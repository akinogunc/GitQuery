//
//  LoginPresenterInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

protocol LoginPresenterInterface {
    func login(credentials: Credential)
    func cancelLoginAction()
    func sendRepositoriesDataToListModule(repos: NSArray)
    func saveCredentials(credentials: Credential)
    func getSavedCredentials() -> Credential
}
