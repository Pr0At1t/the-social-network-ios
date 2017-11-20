//
//  UserSearchTableViewControllerTests.swift
//  TheSocialNetworkTests
//
//  Created by Atul Bipin on 2017-11-19.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

// swiftlint:disable force_cast

import Quick
import Nimble

@testable import TheSocialNetwork
@testable import ReSwift

class UserSearchTableViewControllerTests: QuickSpec {
    override func spec() {
        describe("UserSearchTableViewController") {
            var vc: UserSearchTableViewController!
            var fakeStore: FakeStore!
            var window: UIWindow!

            beforeEach {
                fakeStore = FakeStore()
                vc = UserSearchTableViewController(store: fakeStore)
            }

            it("initializes as expected") {
                expect(vc.filteredUsers).to(beEmpty())
                expect(vc.searchController).to(beAnInstanceOf(UISearchController.self))
            }

            it("subscribes to the store on viewWillAppear") {
                expect(fakeStore.subscribeWasCalled).to(beFalse())

                window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = vc

                expect(fakeStore.subscribeWasCalled).to(beTrue())
            }

            it("dispatches a fetchUsers action on viewWillAppear") {
                expect(fakeStore.wasCalledWithAction(action: MockActions.fetchUsersAction)).to(beFalse())
                let times = fakeStore.dispatchWasCalledTimes

                window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = vc

                expect(fakeStore.wasCalledWithAction(action: MockActions.fetchUsersAction)).to(beTrue())
                expect(fakeStore.dispatchWasCalledTimes).to(equal(times + 1))
            }

            afterEach {
                fakeStore = nil
                vc = nil
            }
        }
    }
}
