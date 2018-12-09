//
//  LoginPresenterInterface.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

protocol LoginPresenterInterface {
    func login(credentials: Credential, remember: Bool)
    func cancelLoginAction()
    func sendRepositoriesDataToListModule(repos: NSArray)
    func getSavedCredentials() -> Credential
    func showErrorAlert(error: String)
}
