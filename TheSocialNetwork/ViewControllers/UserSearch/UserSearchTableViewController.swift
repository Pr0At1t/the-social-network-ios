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

    private var myStore: Store<AppState> = store

    convenience init(store: Store<AppState>) {
        self.init()
        self.myStore = store
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Users"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.myStore.subscribe(self) {
			$0.select {
				$0.userSearchState
			}
		}

        self.myStore.dispatch(fetchUsers(searchController.searchBar.text ?? ""))
	}

	override func viewWillDisappear(_ animated: Bool) {
		self.myStore.unsubscribe(self)
		super.viewWillDisappear(animated)
	}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredUsers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
		cell.textLabel?.text = self.filteredUsers[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Results"
    }
}

extension UserSearchTableViewController: UISearchResultsUpdating {
	// MARK: - UISearchResultsUpdating Delegate
	func updateSearchResults(for searchController: UISearchController) {
        self.myStore.dispatch(fetchUsers(searchController.searchBar.text ?? ""))
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
