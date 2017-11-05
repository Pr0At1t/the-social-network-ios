//
//  Keys.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-10-29.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

// swiftlint:disable force_cast

struct Keys {
    static let apiBaseUrl = {
        return "http://\(Bundle.main.infoDictionary?["DevServerIP"] as! String):5001"
    }()
}
