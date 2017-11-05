//
//  ApiClient.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

enum ApiRoute: String {
	case userSearch = "/search"
	case googleLogin = "/googleLogin"
    case registerUser = "/register"

	func getUrlString() -> String {
		return "\(Keys.apiBaseUrl)\(self.rawValue)"
	}
}

struct ApiClients {
	public static let userSearchClient = UserSearchClient()
	public static let authenticationClient = AuthenticationClient()

	private init() {}
}
