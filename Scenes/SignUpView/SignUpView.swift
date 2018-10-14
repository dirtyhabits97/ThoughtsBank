//
//  SignUpView.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class SignUpView: LoginView {
    
    public let emailTextField: UITextField = {
        let textField = UITextField(keyboardStyle: .email)
        textField.placeholder = "Email"
        textField.borderColor = .gray
        textField.borderWidth = 1
        textField.round = 10
        return textField
    }()
    
    public let phoneNumberTextField: UITextField = {
        let textField = UITextField(keyboardStyle: .phonenumber)
        textField.placeholder = "Phone number"
        textField.borderColor = .gray
        textField.borderWidth = 1
        textField.round = 10
        return textField
    }()
    
    override func setupView() {
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "Already have an account? "))
        attributedText.append(NSAttributedString(string: "Log in", font: nil, color: .blue))
        haveAnAccountButton.attributedTitleForNormal = attributedText
        loginButton.titleForNormal = "Sign up"
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(phoneNumberTextField)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        containerView.addSubview(stackView)
        containerView.addSubview(haveAnAccountButton)
    }
    
}
