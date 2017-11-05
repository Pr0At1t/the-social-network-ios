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
}

enum RoutingType {
	case push
	case root
}

final class AppRouter {
	let navigationController: UINavigationController

	init(window: UIWindow) {
		navigationController = UINavigationController()
		window.rootViewController = navigationController

		store.subscribe(self) {
			$0.select {
				$0.routingState
			}
		}
	}

	fileprivate func pushViewController(identifier: String, animated: Bool) {
		let viewController = instantiateViewController(identifier: identifier)
		let newViewControllerType = type(of: viewController)
		if let currentVC = navigationController.topViewController {
			let currentViewControllertType = type(of: currentVC)
			if currentViewControllertType == newViewControllerType {
				return
			}
		}

		navigationController.pushViewController(viewController, animated: animated)
	}

	fileprivate func changeRootViewController(identifier: String, animated: Bool) {
		let viewController = instantiateViewController(identifier: identifier)

		if viewController.restorationIdentifier != navigationController.topViewController?.restorationIdentifier {
			navigationController.setViewControllers([viewController], animated: animated)
		}
	}

	private func instantiateViewController(identifier: String) -> UIViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		return storyboard.instantiateViewController(withIdentifier: identifier)
	}
}

extension AppRouter: StoreSubscriber {
	func newState(state: RoutingState) {
		let shouldAnimate = navigationController.topViewController != nil
		switch state.routingType {
		case .push:
			pushViewController(identifier: state.navigationState.rawValue, animated: shouldAnimate)
		case .root:
			changeRootViewController(identifier: state.navigationState.rawValue, animated: shouldAnimate)
		}
	}
}
