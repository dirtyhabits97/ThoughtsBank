//
//  NSLayoutAnchor+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

extension NSLayoutAnchor {
    
    @objc func equals(anchor: NSLayoutAnchor, constant: CGFloat = 0) {
        constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    @objc func greaterOrEquals(anchor: NSLayoutAnchor, constant: CGFloat = 0) {
        constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
    }
    
}
