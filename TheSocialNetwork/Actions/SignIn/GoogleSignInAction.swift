//
//  GoogleSignInAction.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func googleSignIn(email: String, fullName: String, firstName: String, lastName: String, idToken: String) -> (AppState, Store<AppState>) -> GoogleSignInAction {
    return { state, store in
        ApiClients.sharedInstance.authenticationClient.signInWithGoogle(idToken: idToken, completion: { _ in })

        return GoogleSignInAction(email: email, fullName: fullName, firstName: firstName, lastName: lastName)
    }
}

struct GoogleSignInAction: Action {
    let email: String
    let fullName: String
    let firstName: String
    let lastName: String
}
