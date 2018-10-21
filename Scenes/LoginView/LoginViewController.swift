//
//  LoginViewController.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/7/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Models
    
    public var viewModel: LoginViewModelProtocol!
    public weak var delegate: AuthenticationViewControllerDelegate?
    
    // MARK: - UI Elements
    
    private weak var loginView: LoginView! { return (view as! LoginView) }
    private weak var usernameTextField: UITextField! { return loginView.usernameTextField  }
    private weak var passwordTextField: UITextField! { return loginView.passwordTextField  }
    private weak var loginButton: UIButton! { return loginView.loginButton  }
    private weak var signupButton: UIButton! { return loginView.haveAnAccountButton }
    
    private let alert = UIAlertController.warningAlert()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = LoginView()
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
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupButtonPressed), for: .touchUpInside)
    }
    
    private func setupBindings() {
        viewModel.isLoading.bind(to: self) { (self, isLoading) in
            print("Login - \(isLoading ? "started" : "stopped") loading")
        }
        viewModel.showError.bind(to: self) { (self, error) in
            print("Login - \(error ? "An" : "No") error occurred")
        }
        viewModel.updateForm.bind(to: self) { (self, _) in
            self.delegate?.didFinishAuthentication()
        }
    }
    
    // MARK: - User Interaction
    
    @objc func loginButtonPressed() {
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
        viewModel.doLogin(with: Credentials(username: username, password: password))
    }
    
    @objc func signupButtonPressed() {
        delegate?.didPressSignUpButton()
    }
    
    private func hideKeyboard() {
        if usernameTextField.isFirstResponder {
            usernameTextField.resignFirstResponder()
        } else if passwordTextField.isFirstResponder {
            passwordTextField.resignFirstResponder()
        }
    }
    
}

extension LoginViewController {
    
    func navigateToSignUp() {
        let viewController = SignUpViewController()
        let viewModel = SignUpViewModel()
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToThoughtList() {
        let viewController = ThoughtListViewController()
        let viewModel = ThoughtListViewModel()
        viewController.viewModel = viewModel
        UIApplication.shared.keyWindow?.rootViewController = viewController.embedInNavController()
    }
    
}
