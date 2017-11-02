//
//  GoogleSignInAction.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func googleSignIn(state: AppState, store: Store<AppState>, idToken: String) -> GoogleSignInAction {
	ApiClients.authenticationClient.signInWithGoogle(idToken: idToken) { response in
		store.dispatch(GoogleSignInSuccess(response: response))
	}

	return GoogleSignInAction()
}

struct GoogleSignInAction: Action {}
