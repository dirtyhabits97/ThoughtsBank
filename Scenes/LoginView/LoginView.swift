//
//  LoginView.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class LoginView: VerticalScrollableView {
    
    // MARK: - UI Elements
    
    public let usernameTextField: UITextField = {
        let textField = UITextField(keyboardStyle: .normal)
        textField.placeholder = "Username"
        textField.borderColor = .gray
        textField.borderWidth = 1
        textField.round = 10
        return textField
    }()
    
    public let passwordTextField: UITextField = {
        let textField = UITextField(keyboardStyle: .password)
        textField.placeholder = "Password"
        textField.borderColor = .gray
        textField.borderWidth = 1
        textField.round = 10
        return textField
    }()
    
    public let loginButton: UIButton = {
        let button = UIButton.roundedButton(round: 10)
        button.titleForNormal = "Login"
        button.backgroundColor = .black
        return button
    }()
    
    public let haveAnAccountButton: UIButton = {
        let button = UIButton()
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "Don't have an account? "))
        attributedText.append(NSAttributedString(string: "Sign up", font: nil, color: .blue))
        button.attributedTitleForNormal = attributedText
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 24
        view.axis = .vertical
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Lifecycle
    
    override func setupView() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        addSubviewToScroll(stackView)
        addSubviewToScroll(haveAnAccountButton)
    }
    
    override func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
        stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        haveAnAccountButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        haveAnAccountButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24).isActive = true
        haveAnAccountButton.topAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor, constant: 24).isActive = true
    }
}
