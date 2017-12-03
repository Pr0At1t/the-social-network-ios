//
//  AppState.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-29.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

public struct AppState: StateType {
	let userSearchState: UserSearchState
	let signInState: SignInState
    let signUpState: SignUpState
    let googleSignInState: GoogleSignInState
}

extension AppState: CustomStringConvertible {
    public var description: String {
        return """
        appState:
            \(googleSignInState)
        """
    }
}
