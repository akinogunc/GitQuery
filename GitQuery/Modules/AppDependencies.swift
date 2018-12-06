//
//  AppDependencies.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    var listWireframe = ListWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window: window)
    }
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor()
        
        listWireframe.rootWireframe = rootWireframe
        listWireframe.listPresenter = listPresenter

        listPresenter.listWireframe = listWireframe
        listPresenter.listInteractor = listInteractor
        
    }
}
