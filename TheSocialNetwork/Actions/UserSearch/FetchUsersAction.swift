//
//  FetchUsersAction.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift
import Alamofire

public typealias FetchUsersAsyncActionCreatorProvider = (String) -> (AppState, Store<AppState>) -> FetchUsersAction?

public func makeFetchUsers(apiClients: ApiClientsProtocol) -> FetchUsersAsyncActionCreatorProvider {
    return { searchString in
        return { state, store in
            let request = apiClients.userSearchClient.searchForUser(with: searchString) { (users: [String]) in
                store.dispatch(LoadUsersAction(users: users))
            }

            return FetchUsersAction(currentRequest: request)
        }
    }
}

let fetchUsers = makeFetchUsers(apiClients: ApiClients.sharedInstance)

public struct FetchUsersAction: Action {
	let currentRequest: DataRequest?
}
