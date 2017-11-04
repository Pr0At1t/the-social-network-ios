//
//  RoutingState.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-29.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

struct RoutingState: StateType {
	var navigationState: RoutingDestination
	var routingType: RoutingType

	init(navigationState: RoutingDestination = .signin) {
		self.navigationState = navigationState
		self.routingType = .push
	}
}
