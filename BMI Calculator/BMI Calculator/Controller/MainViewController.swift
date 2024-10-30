//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Dias Kaussov on 28.10.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        initialSet()
    }
    
    var calculator = CalculatorBrain()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialSet()
    }
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "calculate_background")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let NewController = SecondViewController()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Calculate your BMI"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("CALCULATE", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 3
        slider.minimumValue = 0
        slider.addTarget(nil, action: #selector(sliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let heightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let heightTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 200
        slider.minimumValue = 0
        slider.addTarget(nil, action: #selector(sliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let weightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let weightTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc private func sliderChanged(_ sender: UISlider) {
        let sender = sender
        if sender == heightSlider {
            heightNumberLabel.text = String(format: "%.2f", ceil(sender.value * 100) / 100) + "m"
        } else {
            weightNumberLabel.text = String(format: "%.0f", sender.value) + "Kg"
        }
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        navigationController?.pushViewController(NewController, animated: true)
        let height = heightSlider.value
        let weight = weightSlider.value
        calculator.calculateBmi(height: height, weight: weight)
        NewController.bmiLabel.text = calculator.getBmi()
        NewController.stateLabel.text = calculator.getAdvice()
        NewController.view.backgroundColor = calculator.getColor()
    }
    
    private func initialSet() {
        heightSlider.value = 1.5
        weightSlider.value = 100
        weightNumberLabel.text = "\(100)" + "Kg"
        heightNumberLabel.text = "\(1.5)" + "m"
    }
    
    private func setUI() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(welcomeLabel)
        backgroundImageView.addSubview(calculateButton)
        backgroundImageView.addSubview(heightSlider)
        backgroundImageView.addSubview(weightSlider)
        backgroundImageView.addSubview(heightStack)
        backgroundImageView.addSubview(weightStack)
        heightStack.addArrangedSubview(heightTextLabel)
        heightStack.addArrangedSubview(heightNumberLabel)
        weightStack.addArrangedSubview(weightTextLabel)
        weightStack.addArrangedSubview(weightNumberLabel)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 20),
            welcomeLabel.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: -50),
            
            calculateButton.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -50),
            calculateButton.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            calculateButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            calculateButton.heightAnchor.constraint(equalToConstant: 90),
            
            weightSlider.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -50),
            weightSlider.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            weightSlider.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            
            weightStack.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -10),
            weightStack.trailingAnchor.constraint(equalTo: weightSlider.trailingAnchor, constant: -10),
            weightStack.leadingAnchor.constraint(equalTo: weightSlider.leadingAnchor, constant: 10),
            
            heightSlider.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -50),
            heightSlider.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            heightSlider.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            
            heightStack.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -10),
            heightStack.trailingAnchor.constraint(equalTo: heightSlider.trailingAnchor, constant: -10),
            heightStack.leadingAnchor.constraint(equalTo: heightSlider.leadingAnchor, constant: 10)
        ])
        
    }


}

