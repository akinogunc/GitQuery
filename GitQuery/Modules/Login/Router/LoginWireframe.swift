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
import PKHUD

let LoginViewControllerIdentifier = "LoginViewController"

class LoginWireframe : NSObject {
 
    var loginView : LoginViewController!
    var loginPresenter : LoginPresenter!
    
    func presentLoginModalFrom(viewController: UIViewController) {

        loginView = loginViewControllerFromStoryboard()
        loginView.loginPresenter = loginPresenter
        loginPresenter.loginView = loginView
        
        let modalFrame = CGRect(x: (viewController.view.bounds.width-300)/2, y: 100, width: 300, height: 340)
        let modalController = xModalController(parentViewController: viewController, modalViewController: loginView, modalFrame: modalFrame)
        modalController.showModal()
    }
    
    func dismissModal() {
        self.loginView.dismiss(animated: true, completion: nil)
    }
    
    func loginViewControllerFromStoryboard() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: LoginViewControllerIdentifier) as! LoginViewController
        return viewController
    }

    func showAlertView(error: String){
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
        loginView.present(alert, animated: true, completion: nil)
    }

    func showSuccessAlert() {
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1.0)
    }
}
