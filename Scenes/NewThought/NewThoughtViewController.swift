//
//  NewThoughtViewController.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class NewThoughtViewController: UIViewController {
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newThoughtTextView.becomeFirstResponder()
    }
    
    private func setupView() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = "New Thought"
        let createThoughtButton = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(creatThoughtButtonPressed))
        navigationItem.rightBarButtonItem = createThoughtButton
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    // MARK: - User Interaction
    
    @objc func creatThoughtButtonPressed() {
        guard newThoughtTextView.isClean else { return }
        var thoughtTextRaw = newThoughtTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)
        guard let title = thoughtTextRaw.popFirst() else { return }
        let message = thoughtTextRaw.popFirst()
        createNewThought(title: title, message: message)
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
}
