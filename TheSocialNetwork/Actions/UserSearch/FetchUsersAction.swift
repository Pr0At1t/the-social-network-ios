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

open class FetchUsersFactory {
    /**
        Factory method to create an action creator of type
        `(String) -> (AppState, Store<AppState>) -> FetchUsersAction?`
        - parameters:
            - apiClients: Any struct/class that conforms to the ApiClientsProtocol
    */
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
}

let fetchUsers = FetchUsersFactory().makeFetchUsers(apiClients: ApiClients())

public struct FetchUsersAction: Action {
	let currentRequest: DataRequest?
}
