//
//  NewPage.swift
//  Phone
//
//  Created by Dias Kaussov on 22.10.2024.
//
import UIKit

protocol EditProfileViewControllerDelegate: AnyObject {
    func changeColor(index: Int, color: UIColor)
    func setNewName(index: Int, newName: String)
}

class EditProfileViewController: UIViewController {
    let profile: Profile
    var index: Int
    var delegate: EditProfileViewControllerDelegate?
    
    init(data: Profile, index: Int) {
        self.profile = data
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    private lazy var circle1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private lazy var circle2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private lazy var circle3: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    private lazy var circle4: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    private lazy var circle5: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    private lazy var circle6: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    private lazy var circle7: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    private lazy var circle8: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    lazy var circleView: UIView = {
        let circle = UIView()
        circle.layer.cornerRadius = 150
        circle.backgroundColor = profile.color
        circle.clipsToBounds = true
        circle.layer.masksToBounds = false
        circle.layer.borderWidth = 1
        circle.layer.borderColor = UIColor.white.cgColor
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    lazy var circleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 130, weight: .bold)
        label.text = profile.name.first?.description
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelView: UIView = {
        let circle = UIView()
        circle.layer.borderWidth = 1
        circle.layer.borderColor = UIColor.white.cgColor
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    lazy var nameLabel: UITextField = {
        let textField = UITextField()
        textField.text = profile.name
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 48, weight: .bold)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private let toolBar: UIToolbar = {
        let tool = UIToolbar()
        tool.barStyle = .default
        tool.isTranslucent = false
        tool.tintColor = .blue
        tool.sizeToFit()
        
        let spaceArea: UIBarButtonItem = .init(systemItem: .flexibleSpace)
        let doneButton: UIBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        
        tool.setItems([spaceArea, doneButton], animated: false)
        tool.isUserInteractionEnabled = true
        
        return tool
    }()
    
    let circleStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let circleStack2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    @objc
    private func donePressed(_ sender: UIToolbar) {
        nameLabel.resignFirstResponder()
        guard let name = nameLabel.text else { return }
        circleLabel.text = name.first?.description
        delegate?.setNewName(index: index, newName: name)
    }
    
    @objc
    private func buttonPressed(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        circleView.backgroundColor = color
        delegate?.changeColor(index: index, color: color)
    }
    
    private func setUI() {
        view.addSubview(circleView)
        view.addSubview(labelView)
        view.addSubview(circleStack1)
        view.addSubview(circleStack2)
        
        circleView.addSubview(circleLabel)
        labelView.addSubview(nameLabel)
        
        circleStack1.addArrangedSubview(circle1)
        circleStack1.addArrangedSubview(circle2)
        circleStack1.addArrangedSubview(circle3)
        circleStack1.addArrangedSubview(circle4)
        circleStack2.addArrangedSubview(circle5)
        circleStack2.addArrangedSubview(circle6)
        circleStack2.addArrangedSubview(circle7)
        circleStack2.addArrangedSubview(circle8)
        
        nameLabel.inputAccessoryView = toolBar
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 300),
            circleView.widthAnchor.constraint(equalToConstant: 300),
            
            labelView.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 10),
            labelView.heightAnchor.constraint(equalToConstant: 90),
            labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            circleStack1.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20),
            circleStack1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            circleStack1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circleStack1.heightAnchor.constraint(equalToConstant: 95),
            
            circleStack2.topAnchor.constraint(equalTo: circleStack1.bottomAnchor, constant: 20),
            circleStack2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            circleStack2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circleStack2.heightAnchor.constraint(equalToConstant: 95),
            
            circleLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            circleLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor)
        ])
    }
}
