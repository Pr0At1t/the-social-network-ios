//
//  SignInTextField.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

@IBDesignable
class SignInTextField: UITextField, UITextFieldDelegate {
	private struct Constants {
		static let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
		static let height: CGFloat = 50
	}

	@IBInspectable
	var placeholderText: String? {
		didSet {
			self.attributedPlaceholder = NSAttributedString(
				string: self.placeholderText ?? "Placeholder",
				attributes: [NSAttributedStringKey.foregroundColor: CustomColors.translucentWhiteA70]
			)
		}
	}

	override init(frame: CGRect) {
		fatalError("SignInTextField should not be inititalized in code")
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupTextView()
		self.delegate = self
	}

	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return UIEdgeInsetsInsetRect(bounds, Constants.padding)
	}

	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return UIEdgeInsetsInsetRect(bounds, Constants.padding)
	}

	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return UIEdgeInsetsInsetRect(bounds, Constants.padding)
	}

	private func setupTextView() {
		self.backgroundColor = CustomColors.translucentWhiteA20
		self.textColor = UIColor.white
		self.borderStyle = .none
	}

	// MARK: - UITextFieldDelegate

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.resignFirstResponder()
		return true
	}
}
