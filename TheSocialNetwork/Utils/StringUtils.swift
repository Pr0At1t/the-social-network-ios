//
//  StringUtils.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-11-21.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

public enum IndentationLevel: String {
    case L1 = "\t"
    case L2 = "\t\t"
    case L3 = "\t\t\t"
    case L4 = "\t\t\t\t"
    case L5 = "\t\t\t\t\t"
}

extension String {
    public func indent(_ level: IndentationLevel) -> String {
        return level.rawValue + self
    }
}
