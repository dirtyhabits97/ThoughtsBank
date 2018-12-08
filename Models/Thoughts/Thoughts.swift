//
//  Thoughts.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

struct Thought {
    let id: String
    let title: String
    let text: String
    let dateString: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, text, author
        case dateString = "date"
    }
}

extension Thought: Decodable { }

extension Thought: Unique {
    
    var identifier: String {
        return id
    }
    
}
