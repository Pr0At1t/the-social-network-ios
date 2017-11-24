//
//  SignInReducer.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func signInReducer(action: Action, state: SignInState?) -> SignInState {
    var state = state ?? SignInState(
        response: nil,
        signingIn: false,
        signedIn: false,
        email: ""
    )

	switch action {
	case _ as GoogleSignInAction:
		state.signingIn = true
	case let googleSignInSuccess as GoogleSignInSuccess:
		state.signingIn = false
		state.response = googleSignInSuccess.response
    case let userLoginAction as SignInState:
        state.email = userLoginAction.email
        state.signingIn = true


    // Change cookies here
	default:
		break
	}

	return state
}
