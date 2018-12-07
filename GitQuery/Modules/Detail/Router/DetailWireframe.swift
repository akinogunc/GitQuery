//
//  DetailWireframe.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

let DetailViewControllerIdentifier = "DetailViewController"

class DetailWireframe: NSObject {

    var detailView : DetailViewController!
    var rootWireframe : RootWireframe!
    var detailPresenter : DetailPresenter!

    func pushDetailViewControllerFrom(viewController: UIViewController, forkUrl: String, repositoryName: String) {
        
        detailView = detailViewControllerFromStoryboard()
        detailView.detailPresenter = detailPresenter
        detailPresenter.detailView = detailView

        detailPresenter.makeNetworkRequestForForks(forkUrl: forkUrl)
        detailPresenter.setDetailViewTitle(repositoryName: repositoryName)

        let navigationController = viewController.navigationController
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    func detailViewControllerFromStoryboard() -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: DetailViewControllerIdentifier) as! DetailViewController
        return viewController
    }

}
