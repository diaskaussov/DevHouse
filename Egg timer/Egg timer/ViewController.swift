//
//  ViewController.swift
//  Egg timer
//
//  Created by Dias Kaussov on 07.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let eggTimes = ["Soft": 20, "Medium": 15, "Hard": 5]
    private var totalTime = 0
    private var secondsPassed = 0
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        setUI()
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let titleLabel: LabelTitle = {
        let cell = LabelTitle(title: "How do you like your eggs?")
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()
    
    private let stackOfEggs: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let softEggImage: UIImage = {
        let image = #imageLiteral(resourceName: "soft_egg")
        return image
    }()
    
    private lazy var buttonSoftEgg: UIButton = {
        let button = UIButton()
        button.setTitle("Soft", for: .normal)
        button.setImage(softEggImage.withRenderingMode(.alwaysOriginal), for: .normal)
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(hardness), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mediumEggImage: UIImage = {
        let image = #imageLiteral(resourceName: "medium_egg")
        return image
    }()
    
    private lazy var buttonMediumEgg: UIButton = {
        let button = UIButton()
        button.setTitle("Medium", for: .normal)
        button.setImage(mediumEggImage, for: .normal)
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(hardness), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonHardEgg: UIButton = {
        let button = UIButton()
        button.setTitle("Hard", for: .normal)
        button.setImage(hardEggImage, for: .normal)
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(hardness), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let hardEggImage: UIImage = {
        let image = #imageLiteral(resourceName: "hard_egg")
        return image
    }()
    
    @IBAction func hardness (_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        progressBar.progress = 0.0
        secondsPassed = 0
        if let totalTime = eggTimes[hardness] {
            self.totalTime = totalTime
        }
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTime),
            userInfo: nil, repeats: true
        )
    }
    
    let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.backgroundColor = .white
        progress.tintColor = .yellow
        return progress
    }()
    
    @objc func updateTime() {
        titleLabel.labelTitle.text = "In process..."
        titleLabel.labelTitle.font = .systemFont(ofSize: 45, weight: .semibold)
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progressBarValue = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = progressBarValue
        }
        else {
            timer.invalidate()
            titleLabel.labelTitle.text = "Done!"
        }
    }
    
    private func setUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(stackOfEggs)
        stackView.addArrangedSubview(progressBar)
        
        stackOfEggs.addArrangedSubview(buttonSoftEgg)
        stackOfEggs.addArrangedSubview(buttonMediumEgg)
        stackOfEggs.addArrangedSubview(buttonHardEgg)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            //stackOfEggs.heightAnchor.constraint(equalToConstant: 200),
            stackOfEggs.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            stackOfEggs.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -20),
            progressBar.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 20)
        ])
    }
}

class LabelTitle: UIView {
    init(title: String) {
        super.init(frame: .zero)
        labelTitle.text = title
        setUI()
    }
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setUI() {
        self.addSubview(labelTitle)
        NSLayoutConstraint.activate([
            labelTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
