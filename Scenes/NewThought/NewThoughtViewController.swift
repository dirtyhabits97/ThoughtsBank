//
//  NewThoughtViewController.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class NewThoughtViewController: UIViewController {
    
    // MARK: - Models
    
    public var viewModel: NewThoughtViewModelProtocol!
    public weak var delegate: NewThoughtViewControllerDelegate?
    
    // MARK: - UI Elements
    
    private weak var newThoughtView: NewThoughtView! { return (view as! NewThoughtView) }
    private weak var newThoughtTextView: UITextView! { return newThoughtView.textView }

    // MARK: - View Lifecycle
    
    override func loadView() {
        view = NewThoughtView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newThoughtTextView.becomeFirstResponder()
    }
    
    private func setupView() {
        let createThoughtButton = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(creatThoughtButtonPressed))
        navigationItem.rightBarButtonItem = createThoughtButton
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    private func setupBindings() {
        viewModel.isLoading.bind(to: self) { (self, isLoading) in
            print("New Thought - \(isLoading ? "started" : "stopped") loading")
        }
        viewModel.showError.bind(to: self) { (self, error) in
            print("New Thought - \(error ? "An" : "No") error occurred")
        }
        viewModel.updateForm.bind(to: self) { (self, _) in
            print("New Thought - Created a new thought")
            self.delegate?.didFinishSaving()
        }
    }
    
    // MARK: - User Interaction
    
    @objc func creatThoughtButtonPressed() {
        guard newThoughtTextView.isClean else { return }
        var thoughtTextRaw = newThoughtTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)
        guard !thoughtTextRaw.isEmpty else { return }
        let title = thoughtTextRaw[0]
        let message = thoughtTextRaw.count == 2 ? thoughtTextRaw[1] : nil
        viewModel.createNewThought(title: title, message: message)
    }
    
    @objc func cancelButtonPressed() {
        self.delegate?.didPressCancelButton()
    }
    
}
