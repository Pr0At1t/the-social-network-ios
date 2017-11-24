//
//  GoogleSignInAction.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func googleSignIn(idToken: String) -> (AppState, Store<AppState>) -> GoogleSignInAction {
    return { state, store in
        ApiClients().authenticationClient.signInWithGoogle(idToken: idToken) { response in
            store.dispatch(GoogleSignInSuccess(response: response))
        }

        return GoogleSignInAction()
    }
}

struct GoogleSignInAction: Action {}
