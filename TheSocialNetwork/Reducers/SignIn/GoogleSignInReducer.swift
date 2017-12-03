//
//  GoogleSignInReducer.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-11-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

typealias GoogleSignInActionPropertyEvalutor = (GoogleSignInAction) -> String

let googleSignInReducer: Reducer<GoogleSignInState> = { action, state in
    return GoogleSignInState(
        email: email(action, state?.email),
        fullName: fullName(action, state?.fullName),
        firstName: firstName(action, state?.firstName),
        lastName: lastName(action, state?.lastName)
    )
}

func makeGoogleSignInReducer(_ propertyEvaluator: @escaping GoogleSignInActionPropertyEvalutor) -> Reducer<String> {
    return { action, state in
        let state = state ?? ""

        switch action {
        case let googleSignInAction as GoogleSignInAction:
            let newState = propertyEvaluator(googleSignInAction)
            return state != newState ? newState : state
        default:
            return state
        }
    }
}

let email = makeGoogleSignInReducer { action in
    return action.email
}

let fullName = makeGoogleSignInReducer { action in
    return action.fullName
}

let firstName = makeGoogleSignInReducer { action in
    return action.firstName
}

let lastName = makeGoogleSignInReducer { action in
    return action.lastName
}

