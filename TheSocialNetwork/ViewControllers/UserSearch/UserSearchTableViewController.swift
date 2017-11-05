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
import ReSwift

class UserSearchTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)

    var filteredUsers = [String]()

	var mockedUsers = [
		"Atul Bipin",
		"Pranav Jain",
		"Ashwin Bipin",
		"Hunter Hoffman",
		"Steve Jobs"
	]

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Users"
        navigationItem.searchController = searchController
        definesPresentationContext = true

		let userCardNib = UINib(nibName: "UserCard", bundle: nil)
		self.tableView.register(userCardNib, forCellReuseIdentifier: "user_card")
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		store.subscribe(self) {
			$0.select {
				$0.userSearchState
			}
		}

		store.dispatch(fetchUsers(state: store.state, store: store, searchString: searchController.searchBar.text ?? ""))
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		store.unsubscribe(self)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mockedUsers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user_card", for: indexPath) as? UserCard
		cell?.userNameLabel?.text = self.mockedUsers[indexPath.row]
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Results"
    }
}

extension UserSearchTableViewController: UISearchResultsUpdating {
	// MARK: - UISearchResultsUpdating Delegate
	func updateSearchResults(for searchController: UISearchController) {
		store.dispatch(fetchUsers(state: store.state, store: store, searchString: searchController.searchBar.text ?? ""))
	}
}

extension UserSearchTableViewController: StoreSubscriber {
	func newState(state: UserSearchState) {
		let shouldUpdate = !(self.filteredUsers.elementsEqual(state.users))
		self.filteredUsers = state.users
		if shouldUpdate {
			self.tableView.reloadData()
		}
	}
}
