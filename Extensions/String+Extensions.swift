//
//  String+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 9/30/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension String {
    
    func cleanned() -> String? {
        let cleanned = trimmingCharacters(in: .whitespaces)
        return cleanned.isEmpty ? nil : cleanned
    }
    
}
