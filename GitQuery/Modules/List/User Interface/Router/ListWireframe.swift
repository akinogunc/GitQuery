//
//  ListWireframe.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation
import UIKit

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
    
}
