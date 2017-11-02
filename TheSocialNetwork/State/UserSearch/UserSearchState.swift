//
//  UserSearchState.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift
import Alamofire

struct UserSearchState: StateType {
	var loading: Bool
	var users: [String]
	var currentRequest: DataRequest?
}
