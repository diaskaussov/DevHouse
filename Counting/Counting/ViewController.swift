//
//  ViewController.swift
//  Counting
//
//  Created by Dias Kaussov on 05.10.2024.
//

import UIKit

class ViewController: UIViewController {
    private var count = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    private let labelNumber: UILabel = {
        let label = UILabel()
        label.text = "1000"
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
        
    private lazy var buttonPress: UIButton = {
        let button = UIButton()
        button.setTitle("Press for increment", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector (increment), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func increment() {
        count += 1000
        labelNumber.text = "\(count)"
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        
        let stackViewConstraints = [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        stackView.addSubview(labelNumber)
        stackView.addSubview(buttonPress)
        
        let labelConstraints = [
            labelNumber.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            labelNumber.centerYAnchor.constraint(equalTo: stackView.centerYAnchor)
        ]
        
        let buttonConstraints = [
            buttonPress.topAnchor.constraint(equalTo: labelNumber.bottomAnchor, constant: 40),
            buttonPress.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
    }

}

