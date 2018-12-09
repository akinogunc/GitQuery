//
//  DetailWireframe.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import PKHUD

let DetailViewControllerIdentifier = "DetailViewController"

class DetailWireframe: NSObject {

    var detailView : DetailViewController!
    var rootWireframe : RootWireframe!
    var detailPresenter : DetailPresenter!

    func pushDetailViewControllerFrom(viewController: UIViewController, forkUrl: String, repositoryName: String) {
        
        detailView = detailViewControllerFromStoryboard()
        detailView.detailPresenter = detailPresenter
        detailPresenter.detailView = detailView

        detailPresenter.makeNetworkRequestForForks(forkUrl: forkUrl, type: .firstQuery)
        detailPresenter.setDetailViewTitle(repositoryName: repositoryName)

        let navigationController = viewController.navigationController
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    func detailViewControllerFromStoryboard() -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: DetailViewControllerIdentifier) as! DetailViewController
        return viewController
    }

    func showAlertView(error: String){
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
        detailView.present(alert, animated: true, completion: nil)
    }

    func showLoadingIndicator(){
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func hideLoadingIndicator() {
        PKHUD.sharedHUD.hide()
    }

}
