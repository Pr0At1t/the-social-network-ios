//
//  AppDelegate.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import ReSwift
import UIKit
import CoreData
import Alamofire
import GoogleSignIn

var store = Store<AppState>(reducer: appReducer, state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var appRouter: AppRouter?

	func application(_ application: UIApplication,
	                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		BuddyBuildSDK.setup()

		UIApplication.shared.statusBarStyle = .lightContent

		let window = UIWindow(frame: UIScreen.main.bounds)
		self.window = window
		window.makeKeyAndVisible()
		self.appRouter = AppRouter(window: window)

		return true
	}

	// This method is for running oauth in all devices iOS 9 and up

	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		return GIDSignIn.sharedInstance().handle(
			url,
			sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
			annotation: options[UIApplicationOpenURLOptionsKey.annotation]
		)
	}
}
