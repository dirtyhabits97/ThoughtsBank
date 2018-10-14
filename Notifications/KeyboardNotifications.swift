//
//  KeyboardNotifications.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

enum NotificationError: LocalizedError {
    case incorrectNotification
    
    var errorDescription: String? {
        switch self {
        case .incorrectNotification: return "Expected a different notification"
        }
    }
    
}

public class KeyboardWillShowNotification {

    private let notification: Notification
    
    public var keyboardHeight: CGFloat {
        return (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
    
    public init(_ notification: Notification) throws {
        guard notification.name == UIResponder.keyboardWillShowNotification else {
            throw NotificationError.incorrectNotification
        }
        self.notification = notification
    }
    
}

public class KeyboardWillHideNotification {
    
    private let notification: Notification
    
    public init(_ notification: Notification) throws {
        guard notification.name == UIResponder.keyboardWillHideNotification else {
            throw NotificationError.incorrectNotification
        }
        self.notification = notification
    }
    
}
