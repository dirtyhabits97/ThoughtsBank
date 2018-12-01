//
//  Observables.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public struct Observable<Observed> {
    
    private var completion: ((Observed) -> Void)?
    
    public mutating func bind<Observer: AnyObject>(to observer: Observer, completion: @escaping (Observer, Observed) -> Void) {
        self.completion = { [weak observer] observed in
            guard let obs = observer else { return }
            completion(obs, observed)
        }
    }
    
    public func notify(with value: Observed) {
        completion?(value)
    }
    
}

public struct ObservableNotification<Observed: TBNotification> {
    
    private var observer: NSObjectProtocol?
    
    public mutating func bind<Observer: AnyObject>(to observer: Observer, completion: @escaping (Observer, Observed) -> Void) {
        self.observer = NotificationCenter.default.addObserver(
            forName: Observed.aliasName ?? Observed.notificationName,
            object: nil,
            queue: nil,
            using: { [weak observer] (notification) in
                guard let o = observer else { return }
                guard let n = try? Observed(notification) else { return }
                completion(o, n)
        })
    }
    
    public func stop() { unsubscribe() }
    
    private func unsubscribe() {
        guard observer != nil else { return }
        NotificationCenter.default.removeObserver(observer!)
    }
    
}
