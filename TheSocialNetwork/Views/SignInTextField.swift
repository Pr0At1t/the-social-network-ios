//
//  SignInTextField.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

class SignInTextField: UITextField {
	override init(frame: CGRect) {
		fatalError("SignInTextField should not be inititalized in code");
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupTextView()
	}
	
	private func setupTextView() {
		self.backgroundColor = CustomColors.translucentWhiteA20
		self.textColor = UIColor.white
		self.attributedPlaceholder = NSAttributedString(string: self.placeholderText ?? "Placeholder", attributes: [NSAttributedStringKey.foregroundColor: CustomColors.translucentWhiteA70])
	}
}
