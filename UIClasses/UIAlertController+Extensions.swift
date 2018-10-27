//
//  UIAlertController+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func warningAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Warning", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        return alert
    }
    
}
