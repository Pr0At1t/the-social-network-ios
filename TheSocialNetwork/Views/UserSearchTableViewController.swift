//
//  UserSearchTableViewController.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-10-22.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension UserSearchTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        getFilteredUsers()
    }
}

class UserSearchTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)

    var filteredUsers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Users"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        getFilteredUsers()
    }

    func searchBarIsEmpty() -> Bool {
        // true by default
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    func getFilteredUsers() {
        let searchText: [String: Any] = ["searchText" : searchController.searchBar.text!]
        let searchURL = "http://192.168.0.18:5001/search"

        Alamofire.request(
            searchURL,
            method: .post,
            parameters: searchText,
            encoding: JSONEncoding.default
            ).responseJSON { response in
                guard let object = response.result.value else {
                    NSLog("Error")
                    return
                }

                let json = JSON(object)
                if let usersData = json.array {
                    let users = usersData.flatMap({(userData: JSON) -> String? in
                        if let firstName = userData["firstName"].string,
                            let lastName = userData["lastName"].string {
                            return "\(firstName) \(lastName)"
                        }
                        return nil
                    })

                    // because inside a callback. Can't 'return' in callbacks
                    self.filteredUsers = users
                    self.tableView.reloadData()
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        if isFiltering() {
           return self.filteredUsers.count
        }
        return self.filteredUsers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        if isFiltering() {
            cell.textLabel?.text = self.filteredUsers[indexPath.row]
        } else {
            cell.textLabel?.text = self.filteredUsers[indexPath.row]
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Results"
    }
}
