//
//  ListPresenter.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class ListPresenter: NSObject, ListPresenterInterface {

    //var userInterface : ListViewInterface?
    var listWireframe : ListWireframe?
    var listInteractor : ListInteractorInput?

    func searchQuery(query: String){
        listInteractor?.sendNetworkRequest(query: query)
    }

}
