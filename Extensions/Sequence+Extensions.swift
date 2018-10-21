//
//  Sequence+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension Sequence {
    // https://www.youtube.com/watch?v=CTZOjl6_NuY
    func pair() -> AnySequence<(Element, Element)> {
        return AnySequence(zip(self, self.dropFirst()))
    }
    
    func group<Key>(by key: (Element) -> Key) -> [Key: [Element]] {
        return reduce(into: [Key: [Element]](), { (result, element) in
            result[key(element), default: []] += [element]
        })
    }
    
    func unique<Key: Equatable>(by key: (Element) -> Key) -> [Element] {
        var uniqueKeys: [Key] = []
        var uniqueElements: [Element] = []
        for element in self {
            let key = key(element)
            if !uniqueKeys.contains(key) {
                uniqueKeys.append(key)
                uniqueElements.append(element)
            }
        }
        return uniqueElements
    }
    
    func all(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) {
                return false
            }
        }
        return true
    }
    
    func none(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return false
            }
        }
        return true
    }
    
    func any(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return true
            }
        }
        return false
    }
    
    func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for element in self {
            if predicate(element) {
                count += 1
            }
        }
        return count
    }
    
}

extension Sequence where Element: Numeric {
    
    func sum() -> Element {
        return reduce(0, +)
    }
    
}
