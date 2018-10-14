//
//  SignUp.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

struct SignUp {
    let email: String
    let phonenumber: String
    let username: String
    let password: String
}

extension SignUp: Encodable {}
