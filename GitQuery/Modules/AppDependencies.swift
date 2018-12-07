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
        
        let detailWireframe = DetailWireframe()
        let detailPresenter = DetailPresenter()
        let detailInteractor = DetailInteractor()
        
        listWireframe.rootWireframe = rootWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.detailWireframe = detailWireframe
        
        listPresenter.listWireframe = listWireframe
        listPresenter.listInteractor = listInteractor
        
        listInteractor.listPresenter = listPresenter
        
        //detail module connections
        detailPresenter.detailWireframe = detailWireframe
        detailPresenter.detailInteractor = detailInteractor
        
        detailWireframe.rootWireframe = rootWireframe
        detailWireframe.detailPresenter = detailPresenter
        
        detailInteractor.detailPresenter = detailPresenter
    }
}
