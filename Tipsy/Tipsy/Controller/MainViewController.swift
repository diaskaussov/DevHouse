//
//  ViewController.swift
//  Tipsy
//
//  Created by Dias Kaussov on 30.10.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var currentButton = ""
    var greenColor = UIColor(red: 0/255.0,
                             green: 176.0/255.0,
                             blue: 107.0/255.0,
                             alpha: 1
                            )
    let NewController = ResultViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 215.0/255.0,
                                       green: 249.0/255.0,
                                       blue: 235.0/255.0,
                                       alpha: 1
                                )
        setUI()
    }
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let billTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e.g. 123,56"
        textField.textColor = .gray
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 40, weight: .light)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Tip"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let splitLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose split"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var button0: UIButton = {
        let button = UIButton()
        button.setTitle("0%", for: .normal)
        button.setTitleColor(greenColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(nil, action: #selector(isTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var button10: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(greenColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(nil, action: #selector(isTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var button20: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(greenColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(nil, action: #selector(isTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stepperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let splitNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let splitStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = greenColor
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(nil, action: #selector(calculateTip), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    private func isTapped(_ sender: UIButton) {
        guard let tappedButton = sender.titleLabel?.text else { return }
        if currentButton != tappedButton {
            if currentButton == "0%" {
                button10.setTitleColor(greenColor, for: .normal)
                button20.setTitleColor(greenColor, for: .normal)
                button10.backgroundColor = .clear
                button20.backgroundColor = .clear
            } else if currentButton == "10%" {
                button0.setTitleColor(greenColor, for: .normal)
                button20.setTitleColor(greenColor, for: .normal)
                button0.backgroundColor = .clear
                button20.backgroundColor = .clear
            } else if currentButton == "20%" {
                button10.setTitleColor(greenColor, for: .normal)
                button0.setTitleColor(greenColor, for: .normal)
                button10.backgroundColor = .clear
                button0.backgroundColor = .clear
            }
            sender.backgroundColor = greenColor
            sender.setTitleColor(.white, for: .normal)
//            sender.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        }
    }
    
    @objc
    private func calculateTip(_ sender: UIButton) {
        navigationController?.pushViewController(ResultViewController(), animated: true)
    }
    
    private func setUI() {
        view.addSubview(topView)
        view.addSubview(stackView)
        view.addSubview(calculateButton)
        topView.addSubview(enterLabel)
        topView.addSubview(billTextField)
        stepperView.addSubview(splitNumberLabel)
        stepperView.addSubview(splitStepper)
        stackView.addArrangedSubview(tipLabel)
        stackView.addArrangedSubview(buttonStack)
        stackView.addArrangedSubview(splitLabel)
        stackView.addArrangedSubview(stepperView)
        buttonStack.addArrangedSubview(button0)
        buttonStack.addArrangedSubview(button10)
        buttonStack.addArrangedSubview(button20)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 200),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            enterLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 40),
            enterLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -40),
            enterLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 10),
//            enterLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            billTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            billTextField.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 60),
            
            tipLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            tipLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            buttonStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            buttonStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            
            splitLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            splitLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            stepperView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            stepperView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            stepperView.heightAnchor.constraint(equalToConstant: 64),
//            stepperView.widthAnchor.constraint(equalToConstant: 100),
            
            button0.topAnchor.constraint(equalTo: buttonStack.topAnchor),
            button0.bottomAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            button0.heightAnchor.constraint(equalToConstant: 64),
            button0.widthAnchor.constraint(equalToConstant: 100),
            
            button10.topAnchor.constraint(equalTo: buttonStack.topAnchor),
            button10.bottomAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            button10.heightAnchor.constraint(equalToConstant: 64),
            button10.widthAnchor.constraint(equalToConstant: 100),
            
            button20.topAnchor.constraint(equalTo: buttonStack.topAnchor),
            button20.bottomAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            button20.heightAnchor.constraint(equalToConstant: 64),
            button20.widthAnchor.constraint(equalToConstant: 100),
            
            splitNumberLabel.centerXAnchor.constraint(equalTo: stepperView.centerXAnchor, constant: -70),
            splitNumberLabel.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor),

            splitStepper.centerXAnchor.constraint(equalTo: stepperView.centerXAnchor, constant: 70),
            splitStepper.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor)
        ])
    }
}
