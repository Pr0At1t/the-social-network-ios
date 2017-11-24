//
//  AlertHelper.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-11-05.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

/**
    This utility class is a wrapper around the UIAlertController functionality
 */
class AlertHelper {
	private init() {}

	private enum Title: String {
		case error = "ERROR"
		case okay = "Okay"
	}

	public static let sharedInstance = AlertHelper()

    /**
        A function that combines an array of strings/messages into one string/message,
        where each message separated by a newline and formatted as follows:
        ````
         ["Lorem", "Ipsem"] -> """
            - Lorem
            - Ipsem
         """
        ````
        - parameters:
            - messages: An array of messages as Strings
        - returns: A single string that is the combination of given array of strings
     */
	private func getMessage(from messages: [String]) -> String {
		return messages.reduce("", { accummulator, message in
			return "\(accummulator)\n- \(message)"
		})
	}

    /**
        Show error popup with multiple messages
        - parameters:
            - messages: An array of strings that will be shown as error messages
            - viewController: The parent view controller that wants to show the error pop up
    */
	func showErrorAlert(with messages: [String], from viewController: UIViewController) {
		showErrorAlert(with: getMessage(from: messages), from: viewController)
	}

    /**
        Show error popup with a single message
        - parameters:
            - messages: Error message to be shown to the user
            - viewController: The parent view controller that wants to show the error pop up
     */
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
