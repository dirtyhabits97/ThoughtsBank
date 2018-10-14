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
    let date: Date
    let author: String
}

extension Thought: Decodable {}
