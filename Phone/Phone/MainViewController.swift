//
//  ViewController.swift
//  Phone
//
//  Created by Dias Kaussov on 19.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var names = [
        Profile(name: "Daniyar", phone: "87777777777", color: .green),
        Profile(name: "Miras", phone: "877777777", color: .green),
        Profile(name: "Madiyar", phone: "877777777", color: .green),
        Profile(name: "Altair", phone: "877777777", color: .green),
        Profile(name: "Raushan", phone: "877777777", color: .green),
        Profile(name: "Dias", phone: "877777777", color: .green),
        Profile(name: "Feraya", phone: "877777777", color: .green),
        Profile(name: "Farabi", phone: "877777777", color: .green),
        Profile(name: "Gulnar", phone: "877777777", color: .green),
        Profile(name: "Nurlybek", phone: "877777777", color: .green),
        Profile(name: "Yersin", phone: "877777777", color: .green)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.dataSource = self
        tableView.delegate = self
//        navigationItem.rightBarButtonItem = navigationUIButton
    }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    
    private func setup() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomCell.identifier,
            for: indexPath
        ) as? CustomCell else {
            fatalError("The tableView could not dequeue a CustomCell")
        }
        cell.configure(name: names[indexPath.row].name,
                       phone: names[indexPath.row].phone,
                       color: names[indexPath.row].color
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let NewController = ProfileEditViewController(data: names[indexPath.row], index: indexPath.row)
        NewController.delegate = self
        self.present(NewController, animated: true, completion: nil)
    }
}

extension ViewController: ProfileEditViewControllerDelegate {
    func changeColor(index: Int, color: UIColor) {
        names[index].color = color
        tableView.reloadData()
    }
}
