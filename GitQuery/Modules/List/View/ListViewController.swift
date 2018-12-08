//
//  ViewController.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class ListViewController: UITableViewController, UISearchBarDelegate, ListViewInterface{

    @IBOutlet var searchBar : UISearchBar!
    var listPresenter : ListPresenterInterface!
    var repositoryItems = [RepositoryItem]()
    var loadMoreEnabled = false
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = UIView()
        tableView.estimatedSectionHeaderHeight = 50

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "Metropolis-Medium", size: 18)!]
        self.title = "Search Repository"

        let backButton:UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        let loginButton:UIBarButtonItem = UIBarButtonItem(title: "My Repos", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapMyRepos))
        self.navigationItem.backBarButtonItem = backButton;
        self.navigationItem.rightBarButtonItem = loginButton;
    }
    
    @objc func didTapMyRepos(){
        currentPage = 1
        loadMoreEnabled = false
        listPresenter.showLogin()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        currentPage = 1
        loadMoreEnabled = true
        listPresenter.searchQuery(query: searchBar.text!, page: currentPage)
        searchBar.resignFirstResponder()
    }

    func showRepositoryItems(items: [RepositoryItem]) {
        
        if currentPage == 1{
            repositoryItems = items
            tableView.reloadData()
        }else{
            if items.count>0{
                repositoryItems.append(contentsOf: items)
                tableView.reloadData()
                loadMoreEnabled = true
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return searchBar
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryItems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "repositoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RepositoryCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        
        let url = URL(string: repositoryItems[indexPath.row].avatarUrl)!
        let placeholderImage = UIImage(named: "placeholder")!

        cell.descriptionLabel.text = repositoryItems[indexPath.row].description
        cell.name.text = repositoryItems[indexPath.row].repositoryName
        cell.avatar.roundImage().af_setImage(withURL: url, placeholderImage: placeholderImage)
        cell.stars.text = repositoryItems[indexPath.row].stars.stringValue
        cell.forks.text = repositoryItems[indexPath.row].forks.stringValue
        cell.watchers.text = repositoryItems[indexPath.row].watchers.stringValue

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listPresenter.showDetail(forkUrl: repositoryItems[indexPath.row].forksUrl, repositoryName: repositoryItems[indexPath.row].repositoryName)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastData = repositoryItems.count - 5
       
        if loadMoreEnabled && indexPath.row == lastData{
            loadMoreEnabled = false
            currentPage += 1
            listPresenter.searchQuery(query: searchBar.text!, page: currentPage)
        }
    }

}
