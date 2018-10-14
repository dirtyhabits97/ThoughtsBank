//
//  UIViewController+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func embedInNavController() -> UINavigationController {
        let navController = UINavigationController(rootViewController: self)
        return navController
    }
    
}
