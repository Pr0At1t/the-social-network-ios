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
        errorState: signUpErrorReducer(action: action, state: state?.errorState),
        numTries: 0
    )

    switch action {
    case let signUpAction as SignUpCompletedAction:
        state.isRegistered = signUpAction.isRegistered
    case let signUpErrorAction as SignUpErrorAction:
        state.errorState.errors = signUpErrorAction.errors
        state.errorState.numFails += 1
    case _ as PurgeSignUpErrorAction:
        state.errorState.errors = []
    case _ as SignUpAction:
        state.numTries += 1
    default:
        break
    }

    return state
}

func signUpErrorReducer(action: Action, state: SignUpErrorState?) -> SignUpErrorState {
    var state = state ?? SignUpErrorState(errors: [], numFails: 0)

    switch action {
    case let signUpErrorAction as SignUpErrorAction:
        state.errors = signUpErrorAction.errors
        state.numFails += 1
    default:
        break
    }

    return state
}
