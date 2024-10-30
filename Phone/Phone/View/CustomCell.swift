//
//  CustomCell.swift
//  Phone
//
//  Created by Dias Kaussov on 21.10.2024.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "Custom cell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let circleView: UIView = {
        let circle = UIView()
        circle.layer.cornerRadius = 90/2
        circle.clipsToBounds = true
        circle.layer.masksToBounds = false
        circle.backgroundColor = .blue
        circle.layer.borderWidth = 1
        circle.layer.borderColor = UIColor.white.cgColor
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle;
    }()
    
    let letterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
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
    
    func configure(name: String, phone: String, color: UIColor) {
        nameLabel.text = name
        phoneLabel.text = phone
        letterLabel.text = name.first?.description
        circleView.backgroundColor = color
    }
    
    private func setUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(circleView)
        circleView.addSubview(letterLabel)
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            circleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 90),
            circleView.widthAnchor.constraint(equalToConstant: 90),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            phoneLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            phoneLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            letterLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            letterLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor)
        ])
        
    }
}
