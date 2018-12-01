//
//  Notifications.swift
//  ThoughtsBank
//
//  Created by Gonzalo Reyes Huertas on 12/1/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public enum TBNotificationError: LocalizedError {
    case incorrectNotification
    case incompleteInformation
    
    public var errorDescription: String? {
        switch self {
        case .incorrectNotification: return "Expected a different notification"
        case .incompleteInformation: return "Missing notification information"
        }
    }
}

public protocol TBNotification {
    static var notificationName: Notification.Name { get }
    static var aliasName: Notification.Name? { get }
    init(_ notification: Notification) throws
}

extension TBNotification {
    
    public static var notificationName: Notification.Name {
        let nameString = "\(Self.self)"
        return Notification.Name(nameString)
    }
    
    public static var aliasName: Notification.Name? {
        return nil
    }
}
