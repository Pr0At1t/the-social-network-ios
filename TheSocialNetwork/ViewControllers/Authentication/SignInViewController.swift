//
//  ViewController.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit
import ReSwift

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    private weak var appDelegate = UIApplication.shared.delegate as? AppDelegate

	override func viewDidLoad() {
		super.viewDidLoad()

		// Initialize sign-in
		var configureError: NSError?
		GGLContext.sharedInstance().configureWithError(&configureError)
		assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")

		GIDSignIn.sharedInstance().delegate = self

		GIDSignIn.sharedInstance().uiDelegate = self
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		store.subscribe(self) {
			$0.select {
				$0.signInState
			}
		}
	}

	override func viewWillDisappear(_ animated: Bool) {
		store.unsubscribe(self)
		super.viewWillDisappear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func signInButtonPressed() {
        self.appDelegate?.appRouter?.pushViewController(identifier: RoutingDestination.userSearch.rawValue)
	}

	@IBAction func signInWithGoogleButtonPressed() {
		GIDSignIn.sharedInstance().signIn()
	}
}

extension SignInViewController: GIDSignInDelegate {
	func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
		guard error == nil else {
			print("\(error.localizedDescription)")
			return
		}

		store.dispatch(googleSignIn(idToken: user.authentication.idToken))
	}

	func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
		// Perform any operations when the user disconnects from app here.
		// ...
	}
}

extension SignInViewController: StoreSubscriber {
	func newState(state: SignInState) {
		print("Google SIGN IN RESPONSE")
	}
}
