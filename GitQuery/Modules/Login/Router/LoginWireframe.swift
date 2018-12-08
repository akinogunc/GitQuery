//
//  LoginWireframe.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation
import UIKit
import xModalController

let LoginViewControllerIdentifier = "LoginViewController"

class LoginWireframe : NSObject {
 
    var loginView : LoginViewController!
    var loginPresenter : LoginPresenter!
    
    func presentLoginModalFrom(viewController: UIViewController) {

        loginView = loginViewControllerFromStoryboard()
        loginView.loginPresenter = loginPresenter
        loginPresenter.loginView = loginView
        
        let modalFrame = CGRect(x: (viewController.view.bounds.width-300)/2, y: 150, width: 300, height: 340)
        let modalController = xModalController(parentViewController: viewController, modalViewController: loginView, modalFrame: modalFrame)
        modalController.showModal()
    }
    
    func dismissModal() {
        loginView.dismiss(animated: true, completion: nil)
    }
    
    func loginViewControllerFromStoryboard() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: LoginViewControllerIdentifier) as! LoginViewController
        return viewController
    }

}
