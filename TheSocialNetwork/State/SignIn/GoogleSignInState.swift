//
//  GoogleSignInState.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-11-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

struct GoogleSignInState: StateType {
    var googleEmail: String
    var googleToken: String
}

extension GoogleSignInState: CustomStringConvertible {
    var description: String {
        return """
        googleSignInState:
                googleEmail: \(googleEmail)
                googleToken: \(googleToken)
        """
    }
}
