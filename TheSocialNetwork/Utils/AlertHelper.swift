//
//  AlertHelper.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-11-05.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

class AlertHelper {
	private init() {}

	private enum Title: String {
		case error = "ERROR"
		case okay = "Okay"
	}

	public static let sharedInstance = AlertHelper()

	private func getMessage(from messages: [String]) -> String {
		return messages.reduce("", { accummulator, message in
			return "\(accummulator)\n- \(message)"
		})
	}

    // Function overloading
	func showErrorAlert(with messages: [String], from viewController: UIViewController) {
		showErrorAlert(with: getMessage(from: messages), from: viewController)
	}

	func showErrorAlert(with message: String, from viewController: UIViewController) {
		let alert = UIAlertController(
			title: Title.error.rawValue,
			message: message,
			preferredStyle: .alert
		)
		alert.addAction(UIAlertAction(title: Title.okay.rawValue, style: .default, handler: nil))
		viewController.present(alert, animated: true, completion: nil)
	}
}
