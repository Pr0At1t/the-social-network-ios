//
//  GoogleSignInReducer.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-11-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

let googleSignInReducer: Reducer<GoogleSignInState> = { action, state in
    return GoogleSignInState(googleEmail: googleEmail(action, state?.googleEmail), googleToken: googleToken(action, state?.googleToken))
}

let googleEmail: Reducer<String> = { action, state in
    var state = state ?? ""

    switch action {
    case let googleSignInSuccess as GoogleSignInSuccess:
        return state != googleSignInSuccess.email ? googleSignInSuccess.email : state
    default:
        return state
    }
}

let googleToken: Reducer<String> = { action, state in
    var state = state ?? ""

    switch action {
    case let googleSignInSuccess as GoogleSignInSuccess:
        return state != googleSignInSuccess.token ? googleSignInSuccess.token : state
    default:
        return state
    }
}
