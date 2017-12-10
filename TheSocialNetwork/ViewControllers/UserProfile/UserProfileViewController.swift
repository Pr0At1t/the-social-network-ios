//
//  UserProfileViewController.swift
//  TheSocialNetwork
//
//  Created by Pranav Jain on 2017-12-03.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var emailField: UserProfileField!
    @IBOutlet weak var nameField: UserProfileField!
    @IBOutlet weak var dobField: UserProfileField!
    @IBOutlet weak var countryField: UserProfileField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailField.value = "atulbipin@gmail.com"
        self.nameField.value = "Atul"
        self.dobField.value = "16/08/1998"
        self.countryField.value = "UAE"
    }
}
