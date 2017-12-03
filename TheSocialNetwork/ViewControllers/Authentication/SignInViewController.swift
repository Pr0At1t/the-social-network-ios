//
//  ViewController.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit
import ReSwift
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    private weak var appDelegate = UIApplication.shared.delegate as? AppDelegate

	override func viewDidLoad() {
		super.viewDidLoad()

        var myClientId: String = ""
        if let fileUrl = Bundle.main.url(forResource: "GoogleService-Info", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil
            ) as? [String: Any] {
                myClientId = result?["CLIENT_ID"] as? String ?? ""
            }
        }

		GIDSignIn.sharedInstance().clientID = myClientId

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

        let idToken = user.authentication.idToken ?? ""
        let fullName = user.profile.name ?? ""
        let firstName = user.profile.givenName ?? ""
        let lastName = user.profile.familyName ?? ""
        let email = user.profile.email ?? ""

		store.dispatch(googleSignIn(
            email: email,
            fullName: fullName,
            firstName: firstName,
            lastName: lastName,
            idToken: idToken
        ))
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
