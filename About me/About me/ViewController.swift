//
//  ViewController.swift
//  About me
//
//  Created by Dias Kaussov on 01.10.2024.
///Users/diaskaussov/Desktop/Programming/About me/About me/ViewController.swift

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        SetupUI()
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    } ()
    
    private let stackCommon: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.backgroundColor = .green
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    private let imageView: UIImageView = {
        let UIImageView = UIImageView()
        UIImageView.image = UIImage(systemName: "person.circle")
        UIImageView.contentMode = .scaleAspectFit
        UIImageView.tintColor = .black
        UIImageView.backgroundColor = .lightGray
        UIImageView.translatesAutoresizingMaskIntoConstraints = false
        UIImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return UIImageView
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.text = "Michael Jordan, Zurich, Switzerland"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true

        return label
    } ()
    
    private let customCell: UIView = {
        let cell = CustomCell(title: "About me", text: " OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW")
        cell.backgroundColor = .systemPink
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.heightAnchor.constraint(equalToConstant: 200).isActive = true  // Set a fixed height
        return cell
    }()
    
    
    private let labelAboutMe: UILabel = {
        let label = UILabel()
        label.text = "About me"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    } ()

    private let labelText: UILabel = {
        let label = UILabel()
        label.text = " OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW OJEGHWO EIFHGOEWHFGO IHEGFPIQEHG PFJEQPO GHEPOQWHGP OQEHGPEWHPI GHWEIGHJIO WEHGOHWE GHOIW"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.numberOfLines = 0
        return label
    } ()
    private func SetupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackCommon)
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
                
        let stackCommonConstraints = [
            stackCommon.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackCommon.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackCommon.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stackCommon.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackCommon.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(stackCommonConstraints)
        
        
        stackCommon.addArrangedSubview(imageView)
        stackCommon.addArrangedSubview(labelName)
        stackCommon.addArrangedSubview(customCell)
        
    }
    
    
    private func StackCommon() {
//        stackCommon.addArrangedSubview(stackViewGeneralInfo)
//        stackCommon.addArrangedSubview(stackViewNewInfo)
//        let stackViewNewInfoConstraints = [
//            stackViewNewInfo.topAnchor.constraint(equalTo: stackCommon.topAnchor),
//            stackViewNewInfo.trailingAnchor.constraint(equalTo: stackCommon.trailingAnchor),
//            stackViewNewInfo.leadingAnchor.constraint(equalTo: stackCommon.leadingAnchor),
//            stackViewNewInfo.widthAnchor.constraint(equalTo: stackCommon.widthAnchor),
//            stackViewNewInfo.heightAnchor.constraint(equalToConstant: 300.0)
//        ]
//        
//        let stackViewGeneralInfoConstraints = [
//            stackViewGeneralInfo.topAnchor.constraint(equalTo: stackViewNewInfo.bottomAnchor),
//            stackViewGeneralInfo.bottomAnchor.constraint(equalTo: stackCommon.bottomAnchor),
//            stackViewGeneralInfo.trailingAnchor.constraint(equalTo: stackCommon.trailingAnchor),
//            stackViewGeneralInfo.leadingAnchor.constraint(equalTo: stackCommon.leadingAnchor),
//            stackViewGeneralInfo.widthAnchor.constraint(equalTo: stackCommon.widthAnchor)
//        ]
//        
//        NSLayoutConstraint.activate(stackViewGeneralInfoConstraints)
//        NSLayoutConstraint.activate(stackViewNewInfoConstraints)
//        StackView1()
//        
//        
    }
    
//    private func StackView1() {
//        stackViewNewInfo.addArrangedSubview(imageView)
//        stackViewNewInfo.addArrangedSubview(labelName)
//        stackViewNewInfo.addArrangedSubview(labelCountry)
//        
//        let imageViewConstraints = [
//            imageView.centerXAnchor.constraint(equalTo: stackViewNewInfo.centerXAnchor),
//            imageView.topAnchor.constraint(equalTo: stackViewNewInfo.topAnchor, constant: 30),
//            imageView.widthAnchor.constraint(equalTo: stackViewNewInfo.widthAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 50)
//        ]
//        
//        let labelNameConstraints = [
//            labelName.topAnchor.constraint(equalTo: imageView.bottomAnchor),
//            labelName.centerXAnchor.constraint(equalTo: stackViewNewInfo.centerXAnchor),
//            labelName.heightAnchor.constraint(equalToConstant: 50)
//            
//        ]
//        
//        let labelCountryConstraints = [
//            labelCountry.topAnchor.constraint(equalTo: labelName.bottomAnchor),
//            labelCountry.centerXAnchor.constraint(equalTo: stackViewNewInfo.centerXAnchor),
//            labelCountry.heightAnchor.constraint(equalToConstant: 50)
//        ]
//        
//        NSLayoutConstraint.activate(imageViewConstraints)
//        NSLayoutConstraint.activate(labelNameConstraints)
//        NSLayoutConstraint.activate(labelCountryConstraints)
//        
//        stackViewGeneralInfo.addArrangedSubview(labelAboutMe)
//        
//        let labelAboutMeConstraints = [
//            labelAboutMe.topAnchor.constraint(equalTo: labelName.bottomAnchor),
//            labelAboutMe.centerXAnchor.constraint(equalTo: stackViewNewInfo.centerXAnchor),
//            labelAboutMe.heightAnchor.constraint(equalToConstant: 50)
//        ]
//        
//        NSLayoutConstraint.activate(labelAboutMeConstraints)
//        
//    }
    
}


class CustomCell: UIView {
    init(title: String, text: String) {
        super.init(frame: .zero)
        labelTitle.text = title
        labelText.text = text
        setUI()
    }
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setUI() {
        self.addSubview(labelTitle)
        self.addSubview(labelText)
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            labelText.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 4),
            labelText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

