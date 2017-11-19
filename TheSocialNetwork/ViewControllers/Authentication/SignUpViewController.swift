//
//  SignUpViewController.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-11-03.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit
import ReSwift

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var dob: UITextField!

	private var errors: [ValidationError] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		store.subscribe(self) {
			$0.select {
				$0.signUpState
			}
		}
	}

	override func viewWillDisappear(_ animated: Bool) {
		store.unsubscribe(self)
		store.dispatch(PurgeSignUpErrorAction())
		self.errors = []
		super.viewWillDisappear(animated)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpButtonPressed() {
        let registerAction = SignUpAction(
            email: emailField.text!,
            password: password.text!,
            firstName: firstnameField.text!,
            lastName: lastnameField.text!,
            country: country.text!, dob: dob.text!)

        store.dispatch(acceptUserInput(userData: registerAction))
    }
}

extension SignUpViewController: StoreSubscriber {
	func newState(state: SignUpState) {
		if state.errorState.errors.count > 0 && state.numTries == state.errorState.numFails {
			AlertHelper.sharedInstance.showErrorAlert(
				with: state.errorState.errors.map { $0.message },
				from: self
			)
		}
		self.errors = state.errorState.errors
	}
}
