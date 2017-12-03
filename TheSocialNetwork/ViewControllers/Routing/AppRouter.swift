//
//  AppRouter.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-29.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift

enum RoutingDestination: String {
	case signin = "SignInViewController"
	case userSearch = "UserSearch"
    case register = "SignUp"
    case userProfile = "UserProfile"
}

final class AppRouter {
	let navigationController: UINavigationController

	init(window: UIWindow) {
		self.navigationController = UINavigationController()
		window.rootViewController = self.navigationController
        self.pushViewController(identifier: RoutingDestination.signin.rawValue)
	}

	public func pushViewController(identifier: String, animated: Bool = true) {
		let viewController = instantiateViewController(identifier: identifier)

		self.navigationController.pushViewController(viewController, animated: animated)
	}

    public func popViewController(animated: Bool = true) {
        self.navigationController.popViewController(animated: animated)
    }

	private func instantiateViewController(identifier: String) -> UIViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		return storyboard.instantiateViewController(withIdentifier: identifier)
	}
}
