//
//  Credentials.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

struct Credentials {
    let username: String
    let password: String
}

extension Credentials: Encodable {}
extension Credentials: Decodable {}
