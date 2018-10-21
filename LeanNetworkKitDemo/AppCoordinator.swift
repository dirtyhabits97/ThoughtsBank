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

class ThoughtListCoordinator: Coordinator, ThoughtListViewControllerDelegate {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    private let viewController: ThoughtListViewController!
    private var newThoughtCoordinator: NewThoughtCoordinator?
    
    // MARK: - Initializers
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        viewController = ThoughtListViewController()
        viewController.viewModel = ThoughtListViewModel()
        viewController.delegate = self
    }
    
    // MARK: - Coordinator methods
    
    func start() {
        viewController.title = "Thoughts Bank"
        presenter.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Delegate methods
    
    func didSelect(thought: Thought) {
        print("Did select thought")
        navigateToDetail()
    }
    
    func didPressNewThoughtButton() {
        print("Did press new thought button")
        navigateToNewThought()
    }
    
    // MARK: - Navigate methods
    
    func navigateToNewThought() {
        let navController = UINavigationController()
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.prefersLargeTitles = true
        newThoughtCoordinator = NewThoughtCoordinator(presenter: navController)
        newThoughtCoordinator?.start()
        presenter.present(navController, animated: true)
    }
    
    func navigateToDetail() {
        
    }
    
}

class NewThoughtCoordinator: Coordinator, NewThoughtViewControllerDelegate {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    private let viewController: NewThoughtViewController!
    
    // MARK: - Initializers
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        viewController = NewThoughtViewController()
        viewController.viewModel = NewThoughtViewModel()
        viewController.delegate = self
    }
    
    // MARK: - Coordinator methods
    
    func start() {
        viewController.title = "New Thought"
        presenter.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Delegate methods
    
    func didPressCancelButton() {
        dismiss()
    }
    
    func didFinishSaving() {
        dismiss()
    }
    
    // MARK: - Navigate methods
    
    func dismiss() {
        presenter.dismiss(animated: true)
    }
    
}
