//
//  NewThoughtCoordinator.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/21/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

protocol NewThoughtViewControllerDelegate: AnyObject {
    func didPressCancelButton()
    func didFinishSaving()
}

final class NewThoughtCoordinator: Coordinator, NewThoughtViewControllerDelegate {
    
    // MARK: - Properties
    
    private weak var presenter: UINavigationController!
    private let viewController: NewThoughtViewController
    
    var childCoordinators: [Coordinator] = []
    var didFinish = Observable<Coordinator>()
    
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
        didFinish.notify(with: self)
    }
    
}
