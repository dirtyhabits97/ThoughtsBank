//
//  Collection+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/9/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension Collection {
    
    func groupBy<Key: Equatable>(key: (Element) -> Key) -> [Key: [Element]] {
        return reduce(into: [Key: [Element]](), { (result, e) in
            let k = key(e)
            result[k] = result[k, default: []] + [e]
        })
    }
    
    func unique<Key: Equatable>(predicate: (Element) -> Key) -> [Element] {
        var uniqueKeys: [Key] = []
        var uniqueElements: [Element] = []
        for element in self {
            let elementKey = predicate(element)
            if !uniqueKeys.contains(elementKey) {
                uniqueKeys.append(elementKey)
                uniqueElements.append(element)
            }
        }
        return uniqueElements
    }
    
}
