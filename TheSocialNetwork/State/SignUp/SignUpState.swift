//
//  SignUpState.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-11-03.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

struct SignUpState: StateType {
    var isRegistered: Bool
    var errorState: SignUpErrorState
	var numTries: Int
}

struct SignUpErrorState: StateType {
	var errors: [SignUpValidationError]
	var numFails: Int
}
