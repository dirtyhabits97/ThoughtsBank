//
//  ThoughtListViewController+Networking.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

extension ThoughtListViewController {
    
    internal func fetchThoughts() {
        let thoughtListResource = ThoughtListResource()
        let thoughtListRequest = ApiRequest(resource: thoughtListResource)
        thoughtListRequest.load { (result) in
            switch result {
            case .success(let thoughts):
                self.displayedThoughts = thoughts
            case .failure:
                print("Failed to fetch thoughts")
            }
        }
    }
    
}
