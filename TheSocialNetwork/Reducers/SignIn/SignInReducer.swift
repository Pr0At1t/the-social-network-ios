//
//  SignInReducer.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func signInReducer(action: Action, state: SignInState?) -> SignInState {
	var state = state ?? SignInState(response: nil, signingIn: false)

	switch action {
	default:
		break
	}

	return state
}
