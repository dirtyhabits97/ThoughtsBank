//
//  UIButton+Extensions.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

extension UIButton {
    
    public var titleForNormal: String? {
        get { return title(for: .normal) }
        set { setTitle(newValue, for: .normal) }
    }
    
    public var attributedTitleForNormal: NSAttributedString? {
        get { return attributedTitle(for: .normal) }
        set { setAttributedTitle(newValue, for: .normal) }
    }
    
    public var titleColorForNormal: UIColor? {
        get { return titleColor(for: .normal) }
        set { setTitleColor(newValue, for: .normal) }
    }
    
}

extension UIButton {
    
    static func roundedButton(round: CGFloat) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = round
        button.layer.masksToBounds = true
        return button
    }
    
}
