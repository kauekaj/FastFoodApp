//
//  LoginView.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 25/08/22.
//

import UIKit

public protocol LoginViewDelegate: AnyObject {
    func didTapFacebookLogin()
    func didTapLogin()
}

class LoginView: UIView {
    
    private func getFontAttributes() -> AttributeContainer {
        AttributeContainer([NSAttributedString.Key.font : UIFont(name: "Ubuntu-Bold", size: 12) ?? .systemFont(ofSize: 12)])
    }
    
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
    
    lazy var passwordImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "padlock")
        return element
    }()
    
    lazy var passwordStackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        element.translatesAutoresizingMaskIntoConstraints = false
        element.spacing = 5
        element.axis = .vertical
        element.isLayoutMarginsRelativeArrangement = true
        element.layoutMargins = UIEdgeInsets(top:22, left: 0, bottom: 6, right: 0)
        return element
    }()
    
    lazy var passwordStackLine: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor(red: 0.012, green: 0.02, blue: 0.016, alpha: 1)
        return element
    }()
    
    lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Senha"
        element.font = UIFont.systemFont(ofSize: 14)
        element.textColor = UIColor(red: 0.012, green: 0.02, blue: 0.016, alpha: 1)
        return element
    }()
    
    lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.isHidden = true
        element.keyboardType = .default
        element.autocapitalizationType = .none
        element.autocorrectionType = .no
        element.isSecureTextEntry = true
        return element
    }()
    
    lazy var checkBoxButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setImage(UIImage(named: "emptyReminderCheckBox"), for: .normal)
        element.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        return element
    }()
    
    lazy var passwordreminderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lembrar minha senha"
        label.textColor = UIColor(red: 0.012, green: 0.02, blue: 0.016, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Esqueci minha senha"
        label.textColor = UIColor(red: 0.012, green: 0.02, blue: 0.016, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var facebookLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = UIButton.Configuration.filled()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.configuration?.background.backgroundColor = UIColor(red: 0.259, green: 0.404, blue: 0.698, alpha: 1)
        button.configuration?.title = "Facebook"
        button.configuration?.image = UIImage(named: "facebook-logo")
        button.configuration?.titlePadding = 10
        button.configuration?.imagePadding = 30
        button.configuration?.titleAlignment = .leading
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = UIButton.Configuration.filled()
        button.setTitleColor(.white, for: .normal)
        button.configuration?.background.cornerRadius = 26
        button.configuration?.background.backgroundColor = UIColor(red: 0.882, green: 0.31, blue: 0.09, alpha: 1)
        button.configuration?.title = "Login"
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Private Methods
    
    
    
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
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let emailStackTapped = UITapGestureRecognizer(target: self,
                                                      action: #selector(emailTapped))
        emailStackView.addGestureRecognizer(emailStackTapped)
        
        let passwordStackTapped = UITapGestureRecognizer(target: self,
                                                      action: #selector(passwordTapped))
        passwordStackView.addGestureRecognizer(passwordStackTapped)
    }
    
    func buildViewHierarchy() {
        addSubview(fastFoodLogo)
        addSubview(emailImage)
        addSubview(emailStackView)
        addSubview(emailStackLine)
        addSubview(passwordImage)
        addSubview(passwordStackView)
        addSubview(passwordStackLine)
        addSubview(checkBoxButton)
        addSubview(passwordreminderLabel)
        addSubview(forgotPasswordLabel)
        addSubview(facebookLoginButton)
        addSubview(loginButton)
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
            
            passwordImage.topAnchor.constraint(equalTo: emailImage.bottomAnchor, constant: 23.3),
            passwordImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 45),
            passwordImage.widthAnchor.constraint(equalToConstant: 25.9),
            passwordImage.heightAnchor.constraint(equalToConstant: 41.2),
            
            passwordStackView.bottomAnchor.constraint(equalTo: passwordImage.bottomAnchor),
            passwordStackView.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor),
            passwordStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -38.2),
            passwordStackView.heightAnchor.constraint(equalToConstant: 45),
            
            passwordStackLine.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordStackLine.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            passwordStackLine.heightAnchor.constraint(equalToConstant: 1),
            passwordStackLine.bottomAnchor.constraint(equalTo: passwordStackView.bottomAnchor),
            
            checkBoxButton.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 11.9),
            checkBoxButton.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 15),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 15),
            
            passwordreminderLabel.centerYAnchor.constraint(equalTo: checkBoxButton.centerYAnchor),
            passwordreminderLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor,constant: 9.8),
            
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordreminderLabel.bottomAnchor, constant: 10.36),
            forgotPasswordLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
           
            facebookLoginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 85),
            facebookLoginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 52),
            facebookLoginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -52),
            facebookLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: facebookLoginButton.bottomAnchor, constant: 44.47),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 53),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -53),
            loginButton.heightAnchor.constraint(equalToConstant: 39),
        ])
        
    }
    
    // MARK: - Actions
    @objc
    func emailTapped() {
        emailLabel.font = UIFont.systemFont(ofSize: 11)
        emailTextField.isHidden = false
        emailTextField.becomeFirstResponder()
        emailStackView.layoutMargins = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        emailStackLine.backgroundColor = UIColor(red: 1, green: 0.447, blue: 0.369, alpha: 1)
    }
    
    @objc
    func passwordTapped() {
        passwordLabel.font = UIFont.systemFont(ofSize: 11)
        passwordTextField.isHidden = false
        passwordTextField.becomeFirstResponder()
        passwordStackView.layoutMargins = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        passwordStackLine.backgroundColor = UIColor(red: 1, green: 0.447, blue: 0.369, alpha: 1)
    }
    
    @objc
    func checkBoxTapped() {
        checkBoxButton.isSelected.toggle()
        
        if checkBoxButton.isSelected {
            checkBoxButton.setImage(UIImage(named: "reminderCheckBox"), for: .normal)
        } else {
            checkBoxButton.setImage(UIImage(named: "emptyReminderCheckBox"), for: .normal)
        }
    }
    
    
    @objc
    func didTapLoginButton() {
        if emailTextField.text == "kaue" && passwordTextField.text == "123" {
        delegate?.didTapLogin()
        }
    }
    
}


extension LoginView: UITextFieldDelegate {
    
}
