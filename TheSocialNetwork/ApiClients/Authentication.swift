//
//  Authentication.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import Alamofire

class AuthenticationClient {
	init() {}

	public func signInWithGoogle(idToken: String, completion: @escaping (Any) -> Void) {
		let parameters: [String: Any] = [
			"googleIdToken": idToken
		]

		Alamofire.request(
			ApiRoute.getUrlString(for: .googleLogin),
			method: .post,
			parameters: parameters,
			encoding: JSONEncoding.default
			).responseJSON { response in
				completion(response)
		}
	}
}
