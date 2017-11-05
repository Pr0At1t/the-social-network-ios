//
//  SignUpViewController.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-11-03.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var dob: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

        store.dispatch(acceptUserInput(state: store.state, store: store, userData: registerAction))
        store.dispatch(RoutingAction(destination: .userSearch, routingType: .push))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
