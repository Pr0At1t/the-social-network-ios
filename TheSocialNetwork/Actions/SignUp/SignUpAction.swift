//
//  SignUpAction.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-11-03.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

// Async action creator used to fetch users
func acceptUserInput(state: AppState, store: Store<AppState>, userData: SignUpAction) -> SignUpAction {
    ApiClients.authenticationClient.registerUser(with: userData) { (ifRegistered: Bool) in
        store.dispatch(SignUpCompletedAction(isRegistered: ifRegistered))
    }
    return userData
}

struct SignUpAction: Action {
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
