//
//  FakeStore.swift
//  TheSocialNetworkTests
//
//  Created by Atul Bipin on 2017-11-19.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

@testable import TheSocialNetwork
@testable import ReSwift

public enum MockActions {
    case fetchUsersAction
    case loadUsersAction
    case unknownAction

    public static func identifyAction(action: Action) -> MockActions {
        switch action {
        case _ as FetchUsersAction:
            return .fetchUsersAction
        case _ as LoadUsersAction:
            return .loadUsersAction
        default:
            return .unknownAction
        }
    }
}

public class FakeStore: Store<AppState> {
    var dispatchWasCalled = false
    var subscribeWasCalled = false
    var dispatchWasCalledTimes = 0
    var unsubscribeWasCalled = false
    var currentAction: Action?

    struct DummyAction: Action {}

    func wasCalledWithAction(action: MockActions) -> Bool {
        return MockActions.identifyAction(action: self.currentAction ?? DummyAction()) == action
    }

    convenience init() {
        let mockAppState = AppState(
            userSearchState: UserSearchState(loading: false, users: [], currentRequest: nil),
            signInState: SignInState(response: nil, signingIn: false),
            signUpState: SignUpState(isRegistered: false,
                                     errorState: SignUpErrorState(errors: [], numFails: 0),
                                     numTries: 0
                         ),
            googleSignInState: GoogleSignInState(email: "", fullName: "", firstName: "", lastName: "")
        )

        let fakeReducer = { (action: Action, state: AppState?) -> AppState in
            return mockAppState
        }
        self.init(reducer: fakeReducer, state: nil)
        self.state = mockAppState
    }

    public override func subscribe<SelectedState, S>(
        _ subscriber: S,
        transform: ((Subscription<AppState>) -> Subscription<SelectedState>)?)
        where SelectedState == S.StoreSubscriberStateType,
        S: StoreSubscriber {
            self.subscribeWasCalled = true
    }

    public override func dispatch(_ action: Action) {
        self.dispatchWasCalled = true
        self.dispatchWasCalledTimes += 1
        self.currentAction = action
    }

    public override func unsubscribe(_ subscriber: AnyStoreSubscriber) {
        self.unsubscribeWasCalled = true
    }
}
