//
//  SignUpAction.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-11-03.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

// Async action creator used to fetch users
func acceptUserInput(userData: SignUpAction) -> (AppState, Store<AppState>) -> SignUpAction {
    return { state, store in
        ApiClients().authenticationClient.registerUser(with: userData) { (authenticationStatus: AuthenticationStatus<SignUpValidationError>) in
            switch authenticationStatus {
            case .success(let ifRegistered):
                store.dispatch(SignUpCompletedAction(isRegistered: ifRegistered))
            case .failure(let validationErrors):
                store.dispatch(SignUpErrorAction(errors: validationErrors))
            }
        }
        return userData
    }
}

public struct SignUpAction: Action {
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let country: String
    let dob: String
}

struct SignUpCompletedAction: Action {
    let isRegistered: Bool
}

struct SignUpErrorAction: Action {
	let errors: [SignUpValidationError]
}

struct PurgeSignUpErrorAction: Action {}
