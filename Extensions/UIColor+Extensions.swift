//
//  UIColor+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init?(cgColor: CGColor?) {
        guard let color = cgColor else { return nil }
        self.init(cgColor: color)
    }
    
}
