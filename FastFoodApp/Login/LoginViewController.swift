//
//  ViewController.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 25/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Internal Properties
    var loginView: LoginView?
    
    override func loadView() {
        super.loadView()
        
        loginView = .init()
        view = loginView
    }
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods
    private func setupView() {
        loginView?.delegate = self
       
    }
}

extension LoginViewController: LoginViewDelegate {
    func didTapFacebookLogin() {
        print("didTapFacebookLogin")
    }

    func didTapLogin() {
        print("didTapLogin")
    }
}

