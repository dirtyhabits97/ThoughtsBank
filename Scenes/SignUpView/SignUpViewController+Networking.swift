//
//  SignUpViewController+Networking.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

extension SignUpViewController {
    
    internal func signUp(with userInformation: SignUp) {
        let signupResource = SignUpResource(signUp: userInformation)
        let signupRequest = ApiRequest(resource: signupResource)
        signupRequest.load { (signupResult) in
            switch signupResult {
            case .success(let credentials):
                let loginResource = LoginResource(credentials: credentials)
                let loginRequest = ApiRequest(resource: loginResource)
                loginRequest.load(withCompletion: { (loginResult) in
                    switch loginResult {
                    case .success:
                        self.navigateToThoughtList()
                    case .failure:
                        print("This scenario shouldn not happen")
                    }
                })
                
            case .failure:
                print("Failed to signup")
            }
        }
    }
    
}
