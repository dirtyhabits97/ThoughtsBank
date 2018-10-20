//
//  UIView+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

extension UIView {
    
    public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    public var borderColor: UIColor? {
        get { return UIColor(cgColor: layer.borderColor) }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    public var round: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
}

extension UIView {
    
    public func addAndFill(withSubView view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public func embedInVerticalScrollView(relativeTo parentView: UIView) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .scrollableAxes
        scrollView.addAndFill(withSubView: self)
        parentView.addAndFill(withSubView: scrollView)
        let heightContraint = heightAnchor.constraint(equalTo: parentView.heightAnchor)
        heightContraint.priorityRaw = 250
        heightContraint.isActive = true
        widthAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true
        return scrollView
    }
    
    public func embedInHorizontalScrollView(relativeTo parentView: UIView) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .scrollableAxes
        scrollView.addAndFill(withSubView: self)
        parentView.addAndFill(withSubView: scrollView)
        let widthConstraint = widthAnchor.constraint(equalTo: parentView.widthAnchor)
        widthConstraint.priorityRaw = 250
        widthConstraint.isActive = true
        heightAnchor.constraint(equalTo: parentView.heightAnchor).isActive = true
        return scrollView
    }
    
    public func findMarginConstraint(withView otherView: UIView, attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        let filteredConstraints = constraints.filter({ constraint in
            guard constraint.firstAttribute == attribute && constraint.secondAttribute == attribute else {
                return false
            }
            guard constraint.firstItem === otherView && constraint.secondItem === self ||
                constraint.firstItem === self && constraint.secondItem === otherView else {
                    return false
            }
            return true
        })
        guard filteredConstraints.count == 1 else { return nil }
        return filteredConstraints.first
    }
    
}
