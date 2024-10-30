//
//  ViewController.swift
//  Destini App
//
//  Created by Dias Kaussov on 17.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private var storyBrain = StoryBrain()
    
    private lazy var labelStory: UILabel = {
        let label = UILabel()
        label.text = storyBrain.updateStory()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "background"))
    
    private lazy var choice1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle(storyBrain.updateChoice1(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.titleLabel?.numberOfLines = 0
        button.tintColor = .white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var choice2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle(storyBrain.updateChoice2(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.titleLabel?.numberOfLines = 0
        button.tintColor = .white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func buttonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        storyBrain.nextStory(userAnswer)
        choice1.setTitle(storyBrain.updateChoice1(), for: .normal)
        choice2.setTitle(storyBrain.updateChoice2(), for: .normal)
        labelStory.text = storyBrain.updateStory()
    }
    
    private func setUI() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(labelStory)
        backgroundImageView.addSubview(choice1)
        backgroundImageView.addSubview(choice2)
        
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            labelStory.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            labelStory.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: -50),
            labelStory.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            labelStory.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            
            choice2.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -30),
            choice2.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            choice2.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -20),
            choice2.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 20),
            choice2.heightAnchor.constraint(equalToConstant: 100),
            
            choice1.bottomAnchor.constraint(equalTo: choice2.topAnchor, constant: -10),
            choice1.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            choice1.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -20),
            choice1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 20),
            choice1.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

