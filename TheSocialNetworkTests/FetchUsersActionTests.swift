//
//  FetchUsersActionTests.swift
//  TheSocialNetworkTests
//
//  Created by Atul Bipin on 2017-11-19.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import Quick
import Nimble

@testable import TheSocialNetwork
@testable import ReSwift

class FetchUsersActionTests: QuickSpec {
    override func spec() {
        describe("FetchUsersAction async action creator") {
            var fetchUsers: FetchUsersAsyncActionCreatorProvider!
            var fakeStore: FakeStore!

            beforeEach {
                fetchUsers = FetchUsersFactory().makeFetchUsers(apiClients: FakeApiClients())
                fakeStore = FakeStore()
            }

            it("returns the FetchUsersAction when called") {
                let actionReturned = fetchUsers("user")(fakeStore.state, fakeStore)
                expect(MockActions.identifyAction(action: actionReturned ?? FakeStore.DummyAction()))
                    .to(equal(MockActions.fetchUsersAction))
            }

            it("dispatches LoadUsersAction when apiClient calls the completion callback") {
                let times = fakeStore.dispatchWasCalledTimes

                expect(fakeStore.wasCalledWithAction(action: MockActions.loadUsersAction)).to(beFalse())
                _ = fetchUsers("user")(fakeStore.state, fakeStore)
                expect(fakeStore.wasCalledWithAction(action: MockActions.loadUsersAction)).to(beTrue())
                expect(fakeStore.dispatchWasCalledTimes).to(equal(times + 1))
            }
        }
    }
}
