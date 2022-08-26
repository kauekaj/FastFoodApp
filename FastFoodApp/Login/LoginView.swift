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
    }
    
    func buildViewHierarchy() {
        addSubview(fastFoodLogo)
        addSubview(fastFoodApp)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            fastFoodLogo.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            fastFoodLogo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            fastFoodLogo.widthAnchor.constraint(equalToConstant: 135),
            fastFoodLogo.heightAnchor.constraint(equalToConstant: 155),
            
            fastFoodApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            fastFoodApp.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
}

