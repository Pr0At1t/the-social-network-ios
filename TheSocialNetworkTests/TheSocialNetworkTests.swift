//
//  TheSocialNetworkTests.swift
//  TheSocialNetworkTests
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import Quick
import Nimble

@testable import TheSocialNetwork
@testable import ReSwift

class AppReducerTests: QuickSpec {
    override func spec() {
        describe("#appReducer") {
            it("Initializes state correctly") {
                expect(true).to(equal(true))
            }
        }
    }
}
