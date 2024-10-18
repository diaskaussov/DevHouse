//
//  ViewController.swift
//  Quizzler
//
//  Created by Dias Kaussov on 17.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setUI()
    }
    
    private let questionView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = quizBrain.updateText()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trueButton: UIButton = {
        let button = UIButton()
        button.setTitle("True", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var falseButton: UIButton = {
        let button = UIButton()
        button.setTitle("False", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.backgroundColor = .white
        progress.tintColor = .yellow
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 1 / Float (quizBrain.quiz.count)
        return progress
    }()
        
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let trueOrFalse = quizBrain.checkAnswer(userAnswer)
        if trueOrFalse {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        if quizBrain.questionNumber == 0 {
            progressBar.progress = 1 / Float (quizBrain.quiz.count)
        }
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(Update),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc func Update() {
        progressBar.progress = quizBrain.updateProgress()
        questionLabel.text = quizBrain.updateText()
        scoreLabel.text = "Score: \(quizBrain.updateScore())"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
    private func setUI() {
        self.view.addSubview(questionView)
        self.view.addSubview(trueButton)
        self.view.addSubview(falseButton)
        self.view.addSubview(progressBar)
        questionView.addSubview(questionLabel)
        questionView.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            falseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            falseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            falseButton.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -20),
            falseButton.heightAnchor.constraint(equalToConstant: 100),
            
            trueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trueButton.bottomAnchor.constraint(equalTo: falseButton.topAnchor, constant: -20),
            trueButton.heightAnchor.constraint(equalToConstant: 100),
            
            questionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionView.bottomAnchor.constraint(equalTo: trueButton.topAnchor),
            
            questionLabel.trailingAnchor.constraint(equalTo: questionView.trailingAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: questionView.leadingAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: questionView.centerYAnchor),
            questionLabel.centerXAnchor.constraint(equalTo: questionView.centerXAnchor),
            
            scoreLabel.leadingAnchor.constraint(equalTo: questionView.leadingAnchor, constant: 20),
            scoreLabel.topAnchor.constraint(equalTo: questionView.topAnchor, constant: 20)
        ])
    }
}
