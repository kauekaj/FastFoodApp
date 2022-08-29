//
//  LoginView.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 25/08/22.
//

import UIKit

public protocol LoginViewDelegate: AnyObject {
    func didTapFacebookLogin()
    func didTapGoogleLogin()
}

class LoginView: UIView {
    
    // MARK: - Public Properties
    weak var delegate: LoginViewDelegate?

    // MARK: - Private Properties
    
    lazy var fastFoodLogo: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "fastFoodLogo")
        return element
    }()
    
    lazy var emailImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "email")
        return element
    }()
    
    lazy var emailStackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        element.translatesAutoresizingMaskIntoConstraints = false
        element.spacing = 5
        element.axis = .vertical
        element.isLayoutMarginsRelativeArrangement = true
        element.layoutMargins = UIEdgeInsets(top:22, left: 0, bottom: 6, right: 0)
        return element
    }()
    
    lazy var emailStackLine: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor(red: 0.012, green: 0.02, blue: 0.016, alpha: 1)
        return element
    }()
    
    lazy var emailLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "E-mail"
        element.font = UIFont.systemFont(ofSize: 14)
        element.textColor = UIColor(red: 0.012, green: 0.02, blue: 0.016, alpha: 1)
        return element
    }()
    
    lazy var emailTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.isHidden = true
        element.keyboardType = .emailAddress
        element.autocapitalizationType = .none
        element.autocorrectionType = .no
        return element
    }()
    
    
    
    
    
    
    
    @objc
    func emailTapped() {
        emailLabel.font = UIFont.systemFont(ofSize: 11)
        emailTextField.isHidden = false
        emailStackView.layoutMargins = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        emailStackLine.backgroundColor = UIColor(red: 1, green: 0.447, blue: 0.369, alpha: 1)
    }
    
    
    
    
    
    
    lazy var fastFoodApp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fast Food App"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
}

// MARK: - ViewCodable
extension LoginView: ViewCodable {
    func setupView() {
        backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
        
        let emailStackTapped = UITapGestureRecognizer(target: self,
                                                      action: #selector(emailTapped))
        emailStackView.addGestureRecognizer(emailStackTapped)
    }
    
    func buildViewHierarchy() {
        addSubview(fastFoodLogo)
        addSubview(fastFoodApp)
        addSubview(emailImage)
        addSubview(emailStackView)
        addSubview(emailStackLine)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            fastFoodLogo.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            fastFoodLogo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            fastFoodLogo.widthAnchor.constraint(equalToConstant: 135),
            fastFoodLogo.heightAnchor.constraint(equalToConstant: 155),
            
            emailImage.topAnchor.constraint(equalTo: fastFoodLogo.bottomAnchor, constant: 119),
            emailImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            emailImage.widthAnchor.constraint(equalToConstant: 38),
            emailImage.heightAnchor.constraint(equalToConstant: 27),
            
            emailStackView.bottomAnchor.constraint(equalTo: emailImage.bottomAnchor),
            emailStackView.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 14.4),
            emailStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -38.2),
            emailStackView.heightAnchor.constraint(equalToConstant: 45),
            
            emailStackLine.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            emailStackLine.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            emailStackLine.heightAnchor.constraint(equalToConstant: 1),
            emailStackLine.bottomAnchor.constraint(equalTo: emailStackView.bottomAnchor),
            
            fastFoodApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            fastFoodApp.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
}

