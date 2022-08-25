//
//  ViewController.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 25/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    private var customView: LoginView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
    }

    private func buildView() {
        view = LoginView()
        customView = view as? LoginView
    }
}

