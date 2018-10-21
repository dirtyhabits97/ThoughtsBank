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

public final class KeyboardWillShowNotification {

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

public final class KeyboardWillHideNotification {
    
    private let notification: Notification
    
    public init(_ notification: Notification) throws {
        guard notification.name == UIResponder.keyboardWillHideNotification else {
            throw NotificationError.incorrectNotification
        }
        self.notification = notification
    }
    
}

public final class KeyboardObserver {
    
    // MARK: - Observables
    
    private var keyboardWillShowObserver: NSObjectProtocol?
    private var keyboardWillHideObserver: NSObjectProtocol?
    
    public var keyboardWillShow = Observable<KeyboardWillShowNotification>()
    public var keyboardWillHide = Observable<KeyboardWillHideNotification>()
    
    // MARK: - Initializers
    
    init() {
        subscribe()
    }
    
    deinit {
        unsubscribe()
    }
    
    // MARK: - Subscription methods
    
    private func subscribe() {
        keyboardWillShowObserver = NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil,
            using: { [weak self] (notification) in
                guard let self = self else { return }
                guard let wrappedNotification = try? KeyboardWillShowNotification(notification) else { return }
                self.keyboardWillShow.notify(with: wrappedNotification)
        })
        keyboardWillHideObserver = NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil,
            using: { [weak self] (notification) in
                guard let self = self else { return }
                guard let wrappedNotification = try? KeyboardWillHideNotification(notification) else { return }
                self.keyboardWillHide.notify(with: wrappedNotification)
        })
    }
    
    private func unsubscribe() {
        if let obs = keyboardWillShowObserver {
            NotificationCenter.default.removeObserver(obs)
            keyboardWillShowObserver = nil
        }
        if let obs = keyboardWillHideObserver {
            NotificationCenter.default.removeObserver(obs)
            keyboardWillHideObserver = nil
        }
    }
    
}
