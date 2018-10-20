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
    
    private func setupView() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
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
            self.navigateToThoughtList()
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
        navigateToSignUp()
    }
    
}

extension LoginViewController {
    
    func navigateToSignUp() {
        let viewController = SignUpViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToThoughtList() {
        let viewController = ThoughtListViewController()
        UIApplication.shared.keyWindow?.rootViewController = viewController.embedInNavController()
    }
    
}
