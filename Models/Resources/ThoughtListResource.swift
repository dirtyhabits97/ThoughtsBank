//
//  ThoughtListResource.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

class ThoughtListResource: ApiResource {
    typealias Model = [Thought]
    
    var urlString: String { return "http://localhost:3000/u/thoughts" }
    var httpMethod: String { return "GET" }
    
}
