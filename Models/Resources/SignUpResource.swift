//
//  SignUpRequest.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

class SignUpResource: ApiResourceEncodable {
    typealias Model = Credentials
    typealias Body = SignUp
    
    var urlString: String { return "http://localhost:3000/signup" }
    var httpMethod: String { return "POST" }
    
    var body: SignUp
    
    init(signUp: SignUp) {
        self.body = signUp
    }
}
