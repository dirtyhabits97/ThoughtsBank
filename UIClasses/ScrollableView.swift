//
//  ScrollableView.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

public class ScrollableView: UIView {
    
    // MARK: - Observers
    
    private var keyboardWillShowObserver: NSObjectProtocol?
    private var keyboardWillHideObserver: NSObjectProtocol?
    
    // MARK: - Properties
    
    public var orientation: Orientation { return .vertical }
    public var reactToKeyboard: Bool = true {
        didSet { setupKeyboardObserver() }
    }
    
    // MARK: - UI Elements
    
    public let containerView: UIView = UIView()
    public fileprivate(set) var scrollView: UIScrollView!
    
    fileprivate var svbottomConstraint: NSLayoutConstraint!
    fileprivate var cvheightConstraint: NSLayoutConstraint?
    
    // MARK - View Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupScrollView()
        setupConstraints()
        setupKeyboardObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupScrollView()
        setupConstraints()
        setupKeyboardObserver()
    }
    
    deinit {
        keyboardWillShowObserver?.stopObserving()
        keyboardWillHideObserver?.stopObserving()
        keyboardWillShowObserver = nil
        keyboardWillHideObserver = nil
    }
    
    public func setupView() {
        
    }
    
    public func setupConstraints() {
        
    }
    
    public func addSubviewToScroll(_ view: UIView) {
        containerView.addSubview(view)
    }
    
    fileprivate func setupScrollView() {
        switch orientation {
            case .vertical: scrollView = containerView.embedInVerticalScrollView(relativeTo: self)
            case .horizontal: scrollView = containerView.embedInHorizontalScrollView(relativeTo: self)
        }
        svbottomConstraint = findMarginConstraint(withView: scrollView, attribute: .bottom)
        cvheightConstraint = findMarginConstraint(withView: containerView, attribute: .height)
    }
    
    private func setupKeyboardObserver() {
        guard reactToKeyboard else {
            keyboardWillShowObserver?.stopObserving()
            keyboardWillHideObserver?.stopObserving()
            keyboardWillShowObserver = nil
            keyboardWillHideObserver = nil
            return
        }
        guard keyboardWillShowObserver == nil && keyboardWillHideObserver == nil else {
            return
        }
        keyboardWillShowObserver = addKeyboardWillShowObserver({ (notification) in
            self.svbottomConstraint.isActive = false
            self.svbottomConstraint = self.scrollView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -notification.keyboardHeight)
            self.svbottomConstraint.isActive = true
            
            self.cvheightConstraint?.isActive = false
            self.cvheightConstraint = self.containerView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -notification.keyboardHeight)
            self.cvheightConstraint?.isActive = true
            
        })
        keyboardWillHideObserver = addKeyboardWillHideObserver({ (notification) in
            self.svbottomConstraint.isActive = false
            self.svbottomConstraint = self.scrollView?.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            self.svbottomConstraint.isActive = true
            
            self.cvheightConstraint?.isActive = false
            self.cvheightConstraint = self.containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
            self.cvheightConstraint?.isActive = true
        })
    }
    
}

extension ScrollableView {
    
    public enum Orientation {
        case vertical
        case horizontal
    }
    
}

public class VerticalScrollableView: ScrollableView {
    public override var orientation: ScrollableView.Orientation {
        return .vertical
    }
}

public class HorizontalScrollableView: ScrollableView {
    public override var orientation: ScrollableView.Orientation {
        return .horizontal
    }
}

