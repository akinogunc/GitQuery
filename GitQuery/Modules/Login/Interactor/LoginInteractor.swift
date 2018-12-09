//
//  LoginInteractor.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import Alamofire

class LoginInteractor: NSObject, LoginInteractorInput {
    
    var loginPresenter : LoginPresenterInterface!
    let networkManager = LoginNetworkManager()
    
    func sendNetworkRequest(credentials: Credential, remember: Bool) {
        
        networkManager.loginAndGetRepositories(credentials: credentials, completion: {connectionResult in
            
            switch connectionResult {
            case .success(let response):
                self.loginPresenter.sendRepositoriesDataToListModule(repos: response)
                
                if remember{
                    self.saveCredentials(credentials: credentials)
                }else{
                    self.doNotRemember()
                }
                
            case .failure(let error):
                self.loginPresenter.showErrorAlert(error: error)
                self.doNotRemember()
            }

        })
    }
    
    func saveCredentials(credentials: Credential) {
        UserDefaults.standard.set(true, forKey: "remember_me")
        UserDefaults.standard.set(try! PropertyListEncoder().encode(credentials), forKey: "credentials")
        UserDefaults.standard.synchronize()
    }
    
    func getCredentials() -> Credential{
        
        let rememberMe = UserDefaults.standard.bool(forKey: "remember_me")
        
        if rememberMe{
            let data = UserDefaults.standard.value(forKey: "credentials") as? Data
            let credentials = try! PropertyListDecoder().decode(Credential.self, from: data!)
            return credentials
        }else{
            return Credential(username: "", password: "")
        }

    }
    
    func doNotRemember() {
        UserDefaults.standard.set(false, forKey: "remember_me")
        UserDefaults.standard.synchronize()
    }

}
