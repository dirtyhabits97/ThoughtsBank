//
//  ThoughtListView.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/13/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class ThoughtListView: BaseView {
    
    // MARK: - UI Elements
    
    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        return view
    }()
    
    // MARK: - View Lifecycle
    
    override func setupView() {
        backgroundColor = .white
        addAndFill(withSubView: tableView)
    }
    
}
