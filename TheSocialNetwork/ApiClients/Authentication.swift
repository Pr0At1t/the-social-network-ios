//
//  Authentication.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import Alamofire
import SwiftyJSON

public enum AuthenticationStatus<T> {
    case success(status: Bool)
    case failure(errors: [T])
}

public enum SignUpValidationError {
    case email(message: String)
    case password(message: String)
    case firstName(message: String)
    case lastName(message: String)
    case country(message: String)
    case dob(message: String)

	var message: String {
		switch self {
		case .email(let value): return value
		case .password(let value): return value
		case .firstName(let value): return value
		case .lastName(let value): return value
		case .country(let value): return value
		case .dob(let value): return value
		}
	}
}

public enum SignInValidationError {
    case email(message: String)
    case password(message: String)

    var message: String {
        switch self {
        case .email(let value): return value
        case .password(let value): return value
        }
    }
}

open class AuthenticationClient {

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

    public func signInUser(
        with userData: SignInAction,
        completion: @escaping (AuthenticationStatus<SignInValidationError>) -> Void
    ) {
        let parameters: [String: Any] = [
            "email": userData.email,
            "password": userData.password
        ]

        // Alamofire request
    }

    public func registerUser(with userData: SignUpAction, completion: @escaping (AuthenticationStatus<SignUpValidationError>) -> Void) {
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

    private func getRegistrationStatus(from data: Any) -> AuthenticationStatus<SignUpValidationError> {
        let isRegistered = data as? Bool ?? false
        if isRegistered {
            return .success(status: isRegistered)
        } else {
            return .failure(errors: getErrorsFromData(from: data))
        }
    }

    private func getErrorsFromData(from data: Any) -> [SignUpValidationError] {
        let json = JSON(data)
        if let validationErrors = json.array {
            return validationErrors.flatMap({(validationData: JSON) -> SignUpValidationError? in
                if let errMsg = validationData["msg"].string,
                    let param = validationData["param"].string {
                    switch param {
                    case "email": return .email(message: errMsg)
                    case "password": return .password(message: errMsg)
                    case "firstname": return .firstName(message: errMsg)
                    case "lastname": return .lastName(message: errMsg)
                    case "country": return .country(message: errMsg)
                    case "dob": return .dob(message: errMsg)
                    default: return nil
                    }
                }
                return nil
            })
        }

        return []
    }
}
