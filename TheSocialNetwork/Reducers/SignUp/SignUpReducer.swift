//
//  SignUpReducer.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-11-03.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func signUpReducer(action: Action, state: SignUpState?) -> SignUpState {
    var state = state ?? SignUpState(
        isRegistered: false,
        errorState: SignUpErrorState(errors: [])
    )

    switch action {
    case let signUpAction as SignUpCompletedAction:
        state.isRegistered = signUpAction.isRegistered
    case let signUpErrorAction as SignUpErrorAction:
        state.errorState.errors = signUpErrorAction.errors
    case _ as PurgeSignUpErrorAction:
        state.errorState.errors = []
    default:
        break
    }

    return state
}
