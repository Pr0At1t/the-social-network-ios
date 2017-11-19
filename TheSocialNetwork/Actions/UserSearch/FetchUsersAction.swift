//
//  FetchUsersAction.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift
import Alamofire

// Async action creator used to fetch users
func fetchUsers(searchString: String) -> (AppState, Store<AppState>) -> FetchUsersAction {
    return { state, store in
        let request = ApiClients.userSearchClient.searchForUser(with: searchString) { (users: [String]) in
            store.dispatch(LoadUsersAction(users: users))
        }

        return FetchUsersAction(currentRequest: request)
    }
}

struct FetchUsersAction: Action {
	let currentRequest: DataRequest
}
