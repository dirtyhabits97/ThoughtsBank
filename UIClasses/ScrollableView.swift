//
//  ScrollableView.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import TBFoundation
import UIKit

public class ScrollableView: UIView {
    
    // MARK: - Observables
    
    private var keyboardWillShow = ObservableNotification<KeyboardWillShowNotification>()
    private var keyboardWillHide = ObservableNotification<KeyboardWillHideNotification>()
    
    // MARK: - Properties
    
    public var orientation: Orientation { return .vertical }
    
    // MARK: - UI elements
    
    public let containerView: UIView = UIView()
    public private(set) var scrollView: UIScrollView!
    
    private var svbottomConstraint: NSLayoutConstraint!
    private var cvheightConstraint: NSLayoutConstraint?
    
    // MARK - View lifecycle
    
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
    
    public func setupView() {
        
    }
    
    public func setupConstraints() {
        
    }
    
    public func addSubviewToScroll(_ view: UIView) {
        containerView.addSubview(view)
    }
    
    private func setupScrollView() {
        switch orientation {
            case .vertical: scrollView = containerView.embedInVerticalScrollView(relativeTo: self)
            case .horizontal: scrollView = containerView.embedInHorizontalScrollView(relativeTo: self)
        }
        svbottomConstraint = findMarginConstraint(withView: scrollView, attribute: .bottom)
        cvheightConstraint = findMarginConstraint(withView: containerView, attribute: .height)
    }
    
    private func setupKeyboardObserver() {
        keyboardWillShow.bind(to: self) { (self, notification) in
            self.svbottomConstraint.isActive = false
            self.svbottomConstraint = self.scrollView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -notification.keyboardHeight
            )
            self.svbottomConstraint.isActive = true
            
            self.cvheightConstraint?.isActive = false
            self.cvheightConstraint = self.containerView.heightAnchor.constraint(
                equalTo: self.heightAnchor,
                constant: -notification.keyboardHeight
            )
            self.cvheightConstraint?.isActive = true
        }
        
        keyboardWillHide.bind(to: self) { (self, notification) in
            self.svbottomConstraint.isActive = false
            self.svbottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            self.svbottomConstraint.isActive = true
            
            self.cvheightConstraint?.isActive = false
            self.cvheightConstraint = self.containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
            self.cvheightConstraint?.isActive = true
        }
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

