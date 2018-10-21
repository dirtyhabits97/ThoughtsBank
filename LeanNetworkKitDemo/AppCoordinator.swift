//
//  AppCoordinator.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow
    let rootViewController: UINavigationController
    let thoughtListCoordinator: ThoughtListCoordinator
    
    // MARK: - Initializers
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        thoughtListCoordinator = ThoughtListCoordinator(presenter: rootViewController)
    }
    
    // MARK: - Coordinator methods
    
    func start() {
        window.rootViewController = rootViewController
        thoughtListCoordinator.start()
        window.makeKeyAndVisible()
    }
    
}

class ThoughtListCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    private let viewController: ThoughtListViewController!
    
    // MARK: - Initializers
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        viewController = ThoughtListViewController()
        viewController.viewModel = ThoughtListViewModel()
    }
    
    // MARK: - Coordinator methods
    
    func start() {
        viewController.title = "Thoughts Bank"
        presenter.pushViewController(viewController, animated: true)
    }
    
}
