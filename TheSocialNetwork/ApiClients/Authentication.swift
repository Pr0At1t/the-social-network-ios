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
			ApiRoute.googleLogin.getUrlString(),
			method: .post,
			parameters: parameters,
			encoding: JSONEncoding.default
			).responseJSON { response in
				completion(response)
		}
	}

    public func registerUser(with userData: SignUpAction, completion: @escaping (Bool) -> Void) {
        let parameters: [String: Any] = [
            "email": userData.email,
            "password": userData.password,
            "firstname": userData.firstName,
            "lastname": userData.lastName,
            "dob": userData.dob,
            "country": userData.country
        ]

        Alamofire.SessionManager.default.request(
            ApiRoute.registerUser.getUrlString(),
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
            ).responseJSON { response in
                switch response.result {
                case .success(let data):
                    completion(self.getRegistrationStatus(from: data))
                case .failure(let error):
                    print("ERROR registering User: \(String(describing: error))")
                }
        }
    }

    private func getRegistrationStatus(from data: Any) -> Bool {
        // parse the data here
        print(data)
        return true
    }
}
