//
//  SignInState.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

struct SignInState: StateType {
	var response: Any?
	var signingIn: Bool
    var signedIn: Bool
    var email: String
//    var cookies: Any?
}
