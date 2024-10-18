//
//  CustomCell.swift
//  Mentor-Menties
//
//  Created by Dias Kaussov on 12.10.2024.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "Custom cell"
    
    private let mentorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(mentorsLabel)
        
        NSLayoutConstraint.activate([
            mentorsLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            mentorsLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            mentorsLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            mentorsLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
