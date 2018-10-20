//
//  NewThoughtView.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class NewThoughtView: VerticalScrollableView, UITextViewDelegate {
    
    // MARK: - UI Elements
    
    let textView: UITextView = {
        let view = UITextView()
        return view
    }()
    
    // MARK: - View Lifecycle
    
    override func setupView() {
        textView.delegate = self
        containerView.addAndFill(withSubView: textView)
    }
    
    // MARK: - TextFieldDelegate methods
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let replacedText = (textView.text as NSString).replacingCharacters(in: range, with: text) as NSString
        let firstLineRange = replacedText.range(of: "\n")
        
        if firstLineRange.location >= range.location{
            textView.typingAttributes = [.font: UIFont.boldSystemFont(ofSize: 24)]
        } else {
            textView.typingAttributes = [.font: UIFont.systemFont(ofSize: 16)]
        }
        return true
    }
    
}
