//
//  ThoughtListCoordinator.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/21/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

protocol ThoughtListViewControllerDelegate: AnyObject {
    func didSelect(thought: Thought)
    func didPressNewThoughtButton()
}

class ThoughtListCoordinator: Coordinator, ThoughtListViewControllerDelegate {
    
    // MARK: - Properties
    
    private weak var presenter: UINavigationController!
    private let viewController: ThoughtListViewController
    
    var childCoordinators: [Coordinator] = []
    var didFinish = Observable<Coordinator>()
    
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
        print("ThoughtList - Did select thought")
        navigateToDetail()
    }
    
    func didPressNewThoughtButton() {
        print("ThoughtList - Did press new thought button")
        navigateToNewThought()
    }
    
    // MARK: - Navigate methods
    
    func navigateToNewThought() {
        let navController = UINavigationController()
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.prefersLargeTitles = true
        let coordinator = NewThoughtCoordinator(presenter: navController)
        coordinator.start()
        addChild(coordinator)
        presenter.present(navController, animated: true)
    }
    
    func navigateToDetail() {
        print("ThoughtList - Navigate to detail")
    }
    
}
