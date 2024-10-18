//
//  ViewController.swift
//  Mentor-Menties
//
//  Created by Dias Kaussov on 12.10.2024.
//

import UIKit

class ViewController: UIViewController {

    var isMentorSelected: Bool = false
    
    private let mentors = [
        ("Yersin"),
        ("Alisher"),
        ("Amirzhan"),
        ("Yedige"),
        ("Abrorbek")
    ]
    
    private let mentees = [
        ("Dias"),
        ("Sanya"),
        ("Amankeldi"),
        ("Aset"),
        ("Dias"),
        ("Sanya"),
        ("Amankeldi"),
        ("Aset"),
        ("Aldiyar")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setupUI()
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .blue
        table.allowsSelection = true
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        table.rowHeight = 100.0
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var mentorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Mentors", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var menteeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Mentees", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @IBAction func buttonPressed (_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        if userAnswer == "Mentors" {
            isMentorSelected = true
        } else {
            isMentorSelected = false
        }
        tableView.reloadData()
    }
    
    private func setupUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(mentorButton)
        self.view.addSubview(menteeButton)
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            mentorButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mentorButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            mentorButton.widthAnchor.constraint(equalToConstant: 130),
            mentorButton.heightAnchor.constraint(equalToConstant: 100),
            
            menteeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            menteeButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            menteeButton.widthAnchor.constraint(equalToConstant: 130),
            menteeButton.heightAnchor.constraint(equalToConstant: 100),

            tableView.topAnchor.constraint(equalTo: mentorButton.bottomAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isMentorSelected ? mentors.count : mentees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomCell.identifier,
            for: indexPath
        ) as? CustomCell else {
            fatalError("The TableView could not dequeue a CustomCell")
        }
        cell.backgroundColor = .blue
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = "Who is that?"
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
        if isMentorSelected {
            cell.textLabel?.text = mentors[indexPath.row]
        } else {
            cell.textLabel?.text = mentees[indexPath.row]
        }
        return cell
    }
}
