//
//  CreateThoughtResource.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/14/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

class CreateThoughtResource: ApiResourceEncodable {
    typealias Model = EmptyResponse
    typealias Body = CreateThoughtBody

    var urlString: String { return "http://localhost:3000/new" }
    var httpMethod: String { return "POST" }
    
    var body: Body
    
    init(title: String, message: String?) {
        self.body = CreateThoughtBody(title: title, message: message, date: Date())
    }
}

struct CreateThoughtBody {
    let title: String
    let message: String?
    let date: Date
}

extension CreateThoughtBody: Encodable {}

struct EmptyResponse: Decodable {}
