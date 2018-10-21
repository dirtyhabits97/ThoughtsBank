//
//  AppCoordinator.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var didFinish: Observable<Coordinator> { get }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}

extension Coordinator {
    
    func addChild(_ coordinator: Coordinator) {
        coordinator.didFinish.bind(to: self) { (self, coordinator) in
            self.removeChild(coordinator)
        }
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        guard let index = childCoordinators.index(where: { $0 === coordinator }) else { return }
        childCoordinators.remove(at: index)
    }
    
}

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow
    let rootViewController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var didFinish = Observable<Coordinator>()
    
    // MARK: - Initializers
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Coordinator methods
    
    func start() {
        let coordinator = ThoughtListCoordinator(presenter: rootViewController)
        window.rootViewController = rootViewController
        coordinator.start()
        addChild(coordinator)
    }
    
}
