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

	private static let base = "http://10.0.0.117:5001"

	static func getUrlString(for route: ApiRoute) -> String {
		switch route {
		case .userSearch:
			return "\(base)\(ApiRoute.userSearch.rawValue)"
		case .googleLogin:
			return "\(base)\(ApiRoute.googleLogin.rawValue)"
		}
	}
}

struct ApiClients {
	public static let userSearchClient = UserSearchClient()
	public static let authenticationClient = AuthenticationClient()

	private init() {}
}
