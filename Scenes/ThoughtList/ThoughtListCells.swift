//
//  ThoughtListCells.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import UIKit

class ThoughtListTableViewCell: UITableViewCell {
    
    static let identifier = "ThoughtListTableViewCell"
    
    // MARK: - Properties
    
    public var displayedThought: Thought! {
        didSet { setup(for: displayedThought) }
    }
    
    // MARK: - UI Elements
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - View lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(contentLabel)
    }
    
    private func setupConstraints() {
        contentLabel.leadingAnchor.equals(anchor: leadingAnchor, constant: 12)
        contentLabel.trailingAnchor.greaterOrEquals(anchor: trailingAnchor, constant: -12)
        contentLabel.topAnchor.equals(anchor: topAnchor, constant: 8)
        contentLabel.bottomAnchor.equals(anchor: bottomAnchor, constant: -8)
    }
    
    private func setup(for thought: Thought) {
        let attributedString = NSMutableAttributedString()
        attributedString.append(string: thought.title, font: .boldSystemFont(ofSize: 20))
        attributedString.append(string: "\n\n", font: .systemFont(ofSize: 4))
        attributedString.append(string: thought.text, font: .systemFont(ofSize: 14))
        attributedString.append(string: "\n\n", font: .systemFont(ofSize: 4))
        attributedString.append(string: thought.author + " - " + thought.dateString, font: .systemFont(ofSize: 10), color: .lightGray)
        contentLabel.attributedText = attributedString
    }
    
}
