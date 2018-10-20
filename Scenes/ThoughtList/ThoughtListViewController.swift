//
//  ThoughtListViewController.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class ThoughtListViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Models
    
    public var viewModel: ThoughtListViewModelProtocol!
    
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
        setupBindings()
        viewModel.loadData()
    }
    
    private func setupView() {
        // navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = "Thoughts Bank"
        
        let newThought = UIBarButtonItem(
            barButtonSystemItem: .compose,
            target: self,
            action: #selector(newThoughtButtonPressed)
        )
        newThought.tintColor = .blue
        navigationItem.rightBarButtonItem = newThought
        
        // tableview
        tableView.register(ThoughtListTableViewCell.self, forCellReuseIdentifier: ThoughtListTableViewCell.identifier)
        
        tableView.dataSource = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.sectionHeaderHeight = 8
        tableView.sectionFooterHeight = 8
    }
    
    private func setupBindings() {
        viewModel.isLoading.bind(to: self) { (self, isLoading) in
            print("ThoughtList - \(isLoading ? "started" : "stopped") loading")
        }
        viewModel.showError.bind(to: self) { (self, error) in
            print("ThoughtList - \(error ? "An" : "No") error occurred")
        }
        viewModel.updateForm.bind(to: self) { (self, thoughts) in
            print("Did load thoughts. Thoughts count: \(thoughts.count)")
            self.displayedThoughts = thoughts
            self.tableView.reloadData()
        }
    }
    
    // MARK: - User Interaction
    
    @objc func newThoughtButtonPressed() {
        navigateToNewThought()
    }
    
    // MARK: - TableView methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return displayedThoughts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThoughtListTableViewCell.identifier, for: indexPath) as! ThoughtListTableViewCell
        cell.displayedThought = displayedThoughts[indexPath.section]
        return cell
    }
    
}

extension ThoughtListViewController {
    
    func navigateToNewThought() {
        let viewController = NewThoughtViewController()
        present(viewController.embedInNavController(), animated: true)
    }
    
}
