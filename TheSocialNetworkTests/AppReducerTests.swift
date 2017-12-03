//
//  AppReducerTests.swift
//  TheSocialNetworkTests
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import Quick
import Nimble

@testable import TheSocialNetwork
@testable import ReSwift
@testable import Alamofire

class AppReducerTests: QuickSpec {
    override func spec() {
        describe("#appReducer") {
            it("Initializes state correctly") {
                struct DummyAction: Action {}
                let action = DummyAction()

                let appState = appReducer(action: action, state: nil)

                expect(appState.userSearchState.users).to(beEmpty())
                expect(appState.userSearchState.loading).to(beFalse())
                expect(appState.userSearchState.currentRequest ?? nil).to(beNil())

                expect(appState.signInState.response ?? nil).to(beNil())
                expect(appState.signInState.signingIn).to(beFalse())

                expect(appState.signUpState.isRegistered).to(beFalse())
                expect(appState.signUpState.numTries).to(equal(0))
                expect(appState.signUpState.errorState.errors).to(beEmpty())
                expect(appState.signUpState.errorState.numFails).to(equal(0))
            }

            it("correctly passes the action down to userSearchReducer") {
                let action = LoadUsersAction(users: ["Atul"])
                let appState = appReducer(action: action, state: nil)

                expect(appState.userSearchState.users.count).to(equal(1))
                expect(appState.userSearchState.users[0]).to(equal("Atul"))

                expect(appState.userSearchState.loading).to(beFalse())

                expect(appState.userSearchState.currentRequest).to(beNil())
            }

            it("correctly passes the action down to signUpReducer") {
                let action = SignUpAction(email: "", password: "", firstName: "", lastName: "", country: "", dob: "")
                let appState = appReducer(action: action, state: nil)

                expect(appState.signUpState.numTries).to(equal(1))
            }
        }
    }
}
