//
//  ThoughtListViewController.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class ThoughtListViewController: UIViewController {
    
    // MARK: - Objects
    
    public var displayedThoughts: [Thought] = []
    
    // MARK: - UI Elements
    private weak var thoughtListView: ThoughtListView! { return (view as! ThoughtListView) }
    private weak var tableView: UITableView! { return thoughtListView.tableView }
    
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = ThoughtListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = "Thoughts Bank"
        
        let newThought = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(newThoughtButtonPressed))
        newThought.tintColor = .blue
        navigationItem.rightBarButtonItem = newThought
    }
    
    // MARK: - User Interaction
    
    @objc func newThoughtButtonPressed() {
        navigateToNewThought()
    }
    
}

extension ThoughtListViewController {
    
    func navigateToNewThought() {
        let viewController = NewThoughtViewController()
        present(viewController.embedInNavController(), animated: true)
    }
    
}
