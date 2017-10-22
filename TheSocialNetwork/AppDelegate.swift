//
//  AppDelegate.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-20.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication,
	                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		UIApplication.shared.statusBarStyle = .lightContent

		// Initialize sign-in
		var configureError: NSError?
		GGLContext.sharedInstance().configureWithError(&configureError)
		assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")

		GIDSignIn.sharedInstance().delegate = self

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
	}

	func applicationWillTerminate(_ application: UIApplication) {
		self.saveContext()
	}

	// This method is for running oauth in all devices iOS 9 and up

	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		return GIDSignIn.sharedInstance().handle(
			url,
			sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
			annotation: options[UIApplicationOpenURLOptionsKey.annotation]
		)
	}

	// MARK: - Core Data stack

	lazy var persistentContainer: NSPersistentContainer = {
	    /*
	     The persistent container for the application. This implementation
	     creates and returns a container, having loaded the store for the
	     application to it. This property is optional since there are legitimate
	     error conditions that could cause the creation of the store to fail.
	    */
	    let container = NSPersistentContainer(name: "TheSocialNetwork")
		// swiftlint:disable:next unused_closure_parameter
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
	        if let error = error as NSError? {
	            // Replace this implementation with code to handle the error appropriately.

	            /*
	             Typical reasons for an error here include:
	             * The parent directory does not exist, cannot be created, or disallows writing.
	             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
	             * The device is out of space.
	             * The store could not be migrated to the current model version.
	             Check the error message to determine what the actual problem was.
	             */
	            fatalError("Unresolved error \(error), \(error.userInfo)")
	        }
	    })
	    return container
	}()

	// MARK: - Core Data Saving support

	func saveContext () {
	    let context = persistentContainer.viewContext
	    if context.hasChanges {
	        do {
	            try context.save()
	        } catch {
	            // Replace this implementation with code to handle the error appropriately.
	            let nserror = error as NSError
	            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
	        }
	    }
	}

	// MARK: - GIDSignInDelegate

	func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
		guard error == nil else {
			print("\(error.localizedDescription)")
			return
		}

		// Perform any operations on signed in user here.
		// TODO: Use the following properties
		_ = user.userID                  // For client-side use only!
		_ = user.authentication.idToken // Safe to send to the server
		let fullName = user.profile.name
		_ = user.profile.givenName
		_ = user.profile.familyName
		_ = user.profile.email
		// ...

		print("Full Name: \(String(describing: fullName))")
	}

	func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
		// Perform any operations when the user disconnects from app here.
		// ...
	}
}
