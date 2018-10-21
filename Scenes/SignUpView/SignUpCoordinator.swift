//
//  SignUpCoordinator.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/21/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

protocol SignUpViewControllerProtocol: AnyObject {
    func didFinishAuthentication()
    func didPressLoginButton()
}

class SignUpCoordinator: Coordinator, SignUpViewControllerProtocol {
    
    // MARK: - Properties
    
    private weak var presenter: UINavigationController!
    private let viewController: SignUpViewController
    
    var didFinish = Observable<Coordinator>()
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Initializers
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        viewController = SignUpViewController()
        viewController.viewModel = SignUpViewModel()
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
    
    func didPressLoginButton() {
        navigateToLogin()
    }
    
    // MARK: - Navigate methods
    
    func navigateToLogin() {
        presenter.popViewController(animated: true)
        didFinish.notify(with: self)
    }
    
    func navigateToThoughtList() {
        
    }
    
}
