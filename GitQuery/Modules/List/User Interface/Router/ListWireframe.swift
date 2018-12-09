//
//  ListWireframe.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe : NSObject {

    var listPresenter : ListPresenter!
    var rootWireframe : RootWireframe!
    var listView : ListViewController!
    var detailWireframe : DetailWireframe!
    var loginWireframe : LoginWireframe!

    func presentListInterfaceFromWindow(window: UIWindow) {
        listView = listViewControllerFromStoryboard()
        listView.listPresenter = listPresenter
        listPresenter.listView = listView
        rootWireframe.showRootViewController(viewController: listView, inWindow: window)
    }
    
    func pushDetailView(forkUrl: String, repositoryName: String) {
        detailWireframe.pushDetailViewControllerFrom(viewController: listView, forkUrl: forkUrl, repositoryName: repositoryName)
    }
    
    func presentLoginView() {
        loginWireframe.presentLoginModalFrom(viewController: listView)
    }

    func listViewControllerFromStoryboard() -> ListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: ListViewControllerIdentifier) as! ListViewController
        return viewController
    }
    
    func showAlertView(error: String){
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
        listView.present(alert, animated: true, completion: nil)
    }
    
    func showNoResultAlert(){
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: "No Result")
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1.0)
    }
    
    func showLoadingIndicator(){
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func hideLoadingIndicator() {
        PKHUD.sharedHUD.hide()
    }
}
