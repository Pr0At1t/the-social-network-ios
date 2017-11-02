//
//  RoutingReducer.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-29.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
	var state = state ?? RoutingState()

	switch action {
	case let routingAction as RoutingAction:
		state.navigationState = routingAction.destination
	default:
		break
	}

	return state
}
