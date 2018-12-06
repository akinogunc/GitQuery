//
//  ViewController.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UISearchBarDelegate{

    @IBOutlet var searchBar : UISearchBar!
    var presenter : ListPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        presenter.searchQuery(query: searchBar.text!)
        searchBar.resignFirstResponder()
    }


}

