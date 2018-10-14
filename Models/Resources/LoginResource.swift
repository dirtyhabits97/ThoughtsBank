//
//  LoginResource.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

class LoginResource: ApiResourceEncodable {
    
    typealias Model = Response
    typealias Body = Credentials
    
    var urlString: String { return "http://localhost:3000/login" }
    var httpMethod: String { return "POST" }
    
    var body: Credentials
    
    init(credentials: Credentials) {
        self.body = credentials
    }
}

extension LoginResource {
    struct Response: Decodable {
        let allow: Bool
    }
}
