//
//  DetailViewController.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UITableViewController, DetailViewInterface {

    var detailPresenter : DetailPresenterInterface!
    var forkOwners = [ForkOwner]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTitle(repositoryName: String){
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "Metropolis-Medium", size: 18)!]
        self.title = repositoryName
    }

    func showForkOwners(items: [ForkOwner]) {
        forkOwners = items
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forkOwners.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "forkOwnerCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ForkOwnerCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        
        let url = URL(string: forkOwners[indexPath.row].avatarUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        
        cell.loginName.text = forkOwners[indexPath.row].loginName
        cell.avatar.roundImage().af_setImage(withURL: url, placeholderImage: placeholderImage)
        
        return cell
    }


}
