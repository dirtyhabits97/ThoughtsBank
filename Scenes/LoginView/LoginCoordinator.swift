//
//  LoginCoordinator.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/21/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator, AuthenticationViewControllerDelegate {
    
    // MARK: - Properties
    
    private weak var presenter: UINavigationController!
    private let viewController: LoginViewController
    
    var didFinish = Observable<Coordinator>()
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Initializers
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        viewController = LoginViewController()
        viewController.viewModel = LoginViewModel()
        viewController.delegate = self
    }
    
    // MARK: - Coordinator methods
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Delegate methods
    
    func didFinishAuthentication() {
        navigateToThoughtList()
    }
    
    func didPressSignUpButton() {
        navigateToSignUp()
    }
    
    func didPressLoginButton() {
        // do nothing
    }
    
    // MARK: - Navigate methods
    
    func navigateToThoughtList() {
        didFinish.notify(with: self)
    }
    
    func navigateToSignUp() {
        let coordinator = SignUpCoordinator(presenter: presenter)
        coordinator.start()
        addChild(coordinator)
        coordinator.didAuthenticate.bind(to: self) { (self, _) in
            self.didFinish.notify(with: self)
        }
    }
    
}
