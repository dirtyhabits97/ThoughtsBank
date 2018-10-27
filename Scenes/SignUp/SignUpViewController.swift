//
//  SignUpViewController.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit
import LeanToolsKit

class SignUpViewController: UIViewController {
    
    // MARK: - Models
    
    public var viewModel: SignUpViewModelProtocol!
    public weak var delegate: AuthenticationViewControllerDelegate?
    
    // MARK: - UI Elements
    
    private weak var signUpView: SignUpView! { return (view as! SignUpView) }
    private weak var emailTextField: UITextField! { return signUpView.emailTextField }
    private weak var phoneNumberTextField: UITextField! { return signUpView.phoneNumberTextField }
    private weak var usernameTextField: UITextField! { return signUpView.usernameTextField }
    private weak var passwordTextField: UITextField! { return signUpView.passwordTextField  }
    private weak var signupButton: UIButton! { return signUpView.loginButton  }
    private weak var loginButton: UIButton! { return signUpView.haveAnAccountButton }
    
    private let alert = UIAlertController.warningAlert()
    
    // MARK: View lifecycle
    
    override func loadView() {
        view = SignUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideKeyboard()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        signupButton.addTarget(self, action: #selector(signupButtonPressed), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    private func setupBindings() {
        viewModel.isLoading.bind(to: self) { (self, isLoading) in
            print("SignUp - \(isLoading ? "started" : "stopped") loading")
        }
        viewModel.showError.bind(to: self) { (self, error) in
            print("SignUp - \(error ? "An" : "No") error occurred")
        }
        viewModel.updateForm.bind(to: self) { (self, _) in
            self.delegate?.didFinishAuthentication()
        }
    }
    
    // MARK: - User Interaction
    
    @objc func signupButtonPressed() {
        guard let email = usernameTextField.text?.cleanned() else {
            alert.message = "Please enter a valid email"
            present(alert, animated: true)
            return
        }
        guard let phonenumber = phoneNumberTextField.text?.cleanned() else {
            alert.message = "Please enter a valid phonenumber"
            present(alert, animated: true)
            return
        }
        guard let username = usernameTextField.text?.cleanned() else {
            alert.message = "Please enter a valid username"
            present(alert, animated: true)
            return
        }
        guard let password = passwordTextField.text?.cleanned() else {
            alert.message = "Please enter a valid password"
            present(alert, animated: true)
            return
        }
        viewModel.doSignUp(with: SignUp(
            email: email,
            phonenumber: phonenumber,
            username: username,
            password: password
        ))
    }
    
    @objc func loginButtonPressed() {
        delegate?.didPressLoginButton()
    }
    
    private func hideKeyboard() {
        if emailTextField.isFirstResponder {
            emailTextField.resignFirstResponder()
        } else if phoneNumberTextField.isFirstResponder {
            phoneNumberTextField.resignFirstResponder()
        } else if usernameTextField.isFirstResponder {
            usernameTextField.resignFirstResponder()
        } else if passwordTextField.isFirstResponder {
            passwordTextField.resignFirstResponder()
        }
    }
}
