//
//  LoginPresenter.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class LoginPresenter: NSObject, LoginPresenterInterface {
    
    var loginView : LoginViewInterface!
    var loginWireframe : LoginWireframe!
    var loginInteractor : LoginInteractorInput!
    var loginModuleDelegate : LoginModuleDelegate!
    
    func login(credentials: Credential, remember: Bool){
        loginInteractor.sendNetworkRequest(credentials: credentials, remember: remember)
    }
    
    func sendRepositoriesDataToListModule(repos: NSArray) {
        loginModuleDelegate.loggedInAndRetrievedRepositories(repos: repos)
        loginWireframe.showSuccessAlert()
        loginWireframe.dismissModal()
    }
    
    func cancelLoginAction() {
        loginWireframe.dismissModal()
    }
    
    func getSavedCredentials() -> Credential {
        return loginInteractor.getCredentials()
    }
        
    func showErrorAlert(error: String){
        loginWireframe.showAlertView(error: error)
    }

}
