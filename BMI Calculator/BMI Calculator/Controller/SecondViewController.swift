//
//  SecondView.swift
//  BMI Calculator
//
//  Created by Dias Kaussov on 28.10.2024.
//
import UIKit
class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.0/255.0, green: 191.0/255.0, blue: 255.0/255.0, alpha: 1)
        setUI()
    }
    
    let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "result_background"))
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Your result:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bmiLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("RECALCULATE", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.setTitleColor(.systemPurple, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func buttonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setUI() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(resultLabel)
        backgroundImageView.addSubview(resetButton)
        backgroundImageView.addSubview(bmiLabel)
        backgroundImageView.addSubview(stateLabel)
        
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            resultLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: -45),
            
            bmiLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            bmiLabel.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            
            stateLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            stateLabel.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 45),

            
            resetButton.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -50),
            resetButton.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            resetButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            resetButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
}
