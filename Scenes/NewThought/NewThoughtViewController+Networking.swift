//
//  NewThoughtViewController+Networking.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/14/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

extension NewThoughtViewController {
    
    internal func createNewThought(title: String, message: String?) {
        let resource = CreateThoughtResource(title: title, message: message)
        let request = ApiRequest(resource: resource)
        request.load { (result) in
            switch result {
            case .success:
                print("Created new thought")
                self.dismiss(animated: true)
            case .failure:
                print("Failed to create new thought")
            }
        }
    }
    
}
