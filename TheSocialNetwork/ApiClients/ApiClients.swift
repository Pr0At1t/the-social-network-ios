//
//  ApiClient.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

public enum ApiRoute: String {
	case userSearch = "/search"
	case googleLogin = "/googleLogin"
    case registerUser = "/register"

	public func getUrlString() -> String {
		return "\(Keys.apiBaseUrl)\(self.rawValue)"
	}
}

public protocol ApiClientsProtocol {
    var userSearchClient: UserSearchClient { get }
    var authenticationClient: AuthenticationClient { get }
}

public struct ApiClients: ApiClientsProtocol {
	public let userSearchClient = UserSearchClient()
	public let authenticationClient = AuthenticationClient()
}
