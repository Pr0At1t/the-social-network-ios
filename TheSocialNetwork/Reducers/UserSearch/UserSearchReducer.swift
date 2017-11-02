//
//  UserSearchReducer.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func userSearchReducer(action: Action, state: UserSearchState?) -> UserSearchState {
	var state = state ?? UserSearchState(loading: false, users: [], currentRequest: nil)

	switch action {
	case let fetchUsersAction as FetchUsersAction:
		state.currentRequest?.cancel()
		state = UserSearchState(loading: true, users: state.users, currentRequest: fetchUsersAction.currentRequest)
	case let loadUsersAction as LoadUsersAction:
		state.users = loadUsersAction.users
		state.loading = false
		state.currentRequest = nil
	default:
		break
	}

	return state
}
