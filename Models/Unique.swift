//
//  Unique.swift
//  ThoughtsBank
//
//  Created by Gonzalo Reyes Huertas on 12/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

protocol Unique {
    
    var identifier: String { get }
    
}

extension Unique {
    
    static var uniqueIdentifierPrefix: String { return "\(Self.self)" }
    var uniqueIdentifier: String { return Self.uniqueIdentifierPrefix + identifier }
    
}
