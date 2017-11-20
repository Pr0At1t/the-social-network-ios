//
//  UserSearch.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-30.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import Alamofire
import SwiftyJSON

open class UserSearchClient {
	init() {}

	public func searchForUser(with searchString: String, completion: @escaping ([String]) -> Void) -> DataRequest? {
		let parameters: [String: Any] = [
			"searchText": searchString
		]

		return Alamofire.SessionManager.default.request(
			ApiRoute.userSearch.getUrlString(),
			method: .post,
			parameters: parameters,
			encoding: JSONEncoding.default
			).responseJSON { response in
				switch response.result {
				case .success(let data):
					completion(self.extractUsers(from: data))
				case .failure(let error):
					print("ERROR while fetching users in search: \(String(describing: error))")
				}
		}
	}

	private func extractUsers(from data: Any) -> [String] {
		let json = JSON(data)
		if let usersData = json.array {
			return usersData.flatMap({(userData: JSON) -> String? in
				if let firstName = userData["firstName"].string,
					let lastName = userData["lastName"].string {
					return "\(firstName) \(lastName)"
				}
				return nil
			})
		}

		return []
	}
}
