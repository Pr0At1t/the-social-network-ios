//
//  AppReducer.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-29.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
	return AppState(
		userSearchState: userSearchReducer(action: action, state: state?.userSearchState),
		signInState: signInReducer(action: action, state: state?.signInState),
        signUpState: signUpReducer(action: action, state: state?.signUpState)
	)
}
