//
//  KeyboardNotifications.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import TBFoundation
import UIKit

public struct KeyboardWillShowNotification: TBNotification {
    
    public static var aliasName: Notification.Name? { return UIResponder.keyboardWillShowNotification }
    
    // MARK: - Instance properties

    private let notification: Notification
    public let keyboardHeight: CGFloat
    
    // MARK: - Initializer

    public init(_ notification: Notification) throws {
        guard notification.name == KeyboardWillShowNotification.aliasName else {
            throw TBNotificationError.incorrectNotification
        }
        
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            throw TBNotificationError.incompleteInformation
        }
        
        self.notification = notification
        self.keyboardHeight = frame.height
    }

}

public struct KeyboardWillHideNotification: TBNotification {
    
    public static var aliasName: Notification.Name? { return UIResponder.keyboardWillHideNotification }
    
    // MARK: - Instance properties
    
    private let notification: Notification
    
    // MARK: - Initializer
    
    public init(_ notification: Notification) throws {
        guard notification.name == KeyboardWillHideNotification.aliasName else {
            throw TBNotificationError.incorrectNotification
        }
        self.notification = notification
    }
    
}
