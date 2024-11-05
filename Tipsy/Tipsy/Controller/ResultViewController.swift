//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dias Kaussov on 01.11.2024.
//

import UIKit

class ResultViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private let resultView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 215.0/255.0,
                                       green: 249.0/255.0,
                                       blue: 235.0/255.0,
                                       alpha: 1
                                )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.textColor = UIColor(red: 149.0/255.0,
                                  green: 154.0/255.0,
                                  blue: 153.0/255.0,
                                  alpha: 1
                           )
        label.font = .systemFont(ofSize: 30, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultNumber: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0/255.0,
                                  green: 176.0/255.0,
                                  blue: 107.0/255.0,
                                  alpha: 1
                                 )
        label.text = "56.60"
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let finalLabel: UILabel = {
        let label = UILabel()
        label.text = "Split between n people,\n with i percent tip"
        label.textAlignment = .center
        label.textColor = UIColor(red: 149.0/255.0,
                                  green: 154.0/255.0,
                                  blue: 153.0/255.0,
                                  alpha: 1
                           )
        label.font = .systemFont(ofSize: 25, weight: .light)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setUI() {
        view.addSubview(resultView)
        view.addSubview(finalLabel)
        resultView.addSubview(resultLabel)
        resultView.addSubview(resultNumber)
        
        NSLayoutConstraint.activate([
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.heightAnchor.constraint(equalToConstant: 300),
            
            finalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            finalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            finalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            
            resultLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: resultView.centerYAnchor),
            
            resultNumber.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            resultNumber.centerYAnchor.constraint(equalTo: resultView.centerYAnchor, constant: 60)
        ])
    }
}
