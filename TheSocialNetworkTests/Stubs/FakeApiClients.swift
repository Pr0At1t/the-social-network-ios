//
//  FakeApiClients.swift
//  TheSocialNetworkTests
//
//  Created by Atul Bipin on 2017-11-19.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

@testable import TheSocialNetwork
@testable import ReSwift
@testable import Alamofire

struct FakeApiClients: ApiClientsProtocol {
    var userSearchClient = MockUserSearchClient() as UserSearchClient
    var authenticationClient = AuthenticationClient()
}

class MockUserSearchClient: UserSearchClient {
    var searchingWithSearchString = ""
    var searchForUserWasCalled = false
    var searchForUserCallMagnitude = 0

    public override func searchForUser(
        with searchString: String,
        completion: @escaping ([String]) -> Void) -> DataRequest? {

        self.searchingWithSearchString = searchString
        self.searchForUserWasCalled = true
        self.searchForUserCallMagnitude += 1

        completion(["Atul"])

        return nil
    }
}
