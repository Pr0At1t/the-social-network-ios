//
//  ViewController.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, GIDSignInUIDelegate {
	override func viewDidLoad() {
		super.viewDidLoad()

		GIDSignIn.sharedInstance().uiDelegate = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func signInWithGoogleButtonPressed() {
		GIDSignIn.sharedInstance().signIn()
	}
}
