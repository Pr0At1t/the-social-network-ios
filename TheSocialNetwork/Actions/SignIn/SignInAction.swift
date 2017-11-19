//
//  SignInAction.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-11-08.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//
import ReSwift

// Implemented currying
func authenticateManualSignIn(userCredentials: SignInAction) -> (AppState, Store<AppState>) -> SignInAction {
    return { state, store in
        ApiClients().authenticationClient.signInUser(
        with: userCredentials) { (loginStatus: AuthenticationStatus<SignInValidationError>) in
            switch loginStatus {
            case .success:
                store.dispatch(SignInCompletedAction())
//                // push register screen here
            case .failure(let errors):
                store.dispatch(SignInErrorAction(errors: errors))
            }
        }
        return userCredentials
    }
}

public struct SignInAction: Action {
    let email: String
    let password: String
}

public struct SignInCompletedAction: Action {

//     add cookie
}

public struct SignInErrorAction: Action {
    let errors: [SignInValidationError]
}

struct PurgeSignInErrorAction: Action {}
