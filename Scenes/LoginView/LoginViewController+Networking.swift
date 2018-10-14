//
//  LoginViewController+Networking.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

extension LoginViewController {
    
    internal func login(with credentials: Credentials) {
        let resource = LoginResource(credentials: credentials)
        let request = ApiRequest(resource: resource)
        request.load { (result) in
            switch result {
            case .success:
                self.navigateToThoughtList()
            case .failure:
                print("failure")
            }
        }
    }
    
}
