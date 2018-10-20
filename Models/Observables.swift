//
//  Observables.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

class Observable<Observed> {
    
    var completion: ((Observed) -> Void)?
    
    func bind<Observer: AnyObject>(to observer: Observer, completion: @escaping (Observer, Observed) -> Void) {
        self.completion = { [weak observer] observed in
            guard let obs = observer else { return }
            completion(obs, observed)
        }
    }
    
    func notify(with value: Observed) {
        completion?(value)
    }
    
}
