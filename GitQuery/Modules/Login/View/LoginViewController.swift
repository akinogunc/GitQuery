//
//  LoginViewController.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 8.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, LoginViewInterface {

    @IBOutlet var usernameTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    @IBOutlet var rememberButton : UIButton!
    var loginPresenter : LoginPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let credentials = loginPresenter.getSavedCredentials()
        enterSavedCredentials(credentials: credentials)
        
    }
    
    func enterSavedCredentials(credentials: Credential) {
        usernameTextField.text = credentials.username
        passwordTextField.text = credentials.password
        
        if(credentials.username != ""){
            rememberButton.isSelected = true
            rememberButton.backgroundColor = UIColor(red: 86.0/255.0, green: 176.0/255.0, blue: 1, alpha: 1)
        }
    }
    
    @IBAction func login() {
        let credentials = Credential(username: usernameTextField.text!, password: passwordTextField.text!)
        
        loginPresenter.login(credentials: credentials)
        
        if rememberButton.isSelected{
            loginPresenter.saveCredentials(credentials: credentials)
        }
    }
    
    @IBAction func cancel() {
        loginPresenter.cancelLoginAction()
    }

    @IBAction func rememberMe() {
        if rememberButton.isSelected{
            rememberButton.isSelected = false
            rememberButton.backgroundColor = UIColor.groupTableViewBackground
        }else{
            rememberButton.isSelected = true
            rememberButton.backgroundColor = UIColor(red: 86.0/255.0, green: 176.0/255.0, blue: 1, alpha: 1)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField.tag == 1){
            passwordTextField.becomeFirstResponder()
        }else if(textField.tag == 2){
            passwordTextField.resignFirstResponder()
            login()
        }
        
        return true
    }

}
