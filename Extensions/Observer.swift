//
//  Observer.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

extension NSObjectProtocol {
    
    func stopObserving() {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension UIResponder {
    
    func addKeyboardWillShowObserver(_ handler: @escaping (KeyboardWillShowNotification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: { [weak self] (notification) in
            guard self != nil else { return }
            guard let wrappedNotification = try? KeyboardWillShowNotification(notification) else { return }
            handler(wrappedNotification)
        })
    }
    
    func addKeyboardWillHideObserver(_ handler: @escaping (KeyboardWillHideNotification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: { [weak self] (notification) in
            guard self != nil else { return }
            guard let wrappedNotification = try? KeyboardWillHideNotification(notification) else { return }
            handler(wrappedNotification)
        })
    }
    
}
