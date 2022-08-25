//
//  LoginView.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 25/08/22.
//

import UIKit

class LoginView: UIView {
 
    lazy var helloWorld: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello World!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupView()
        setupConstraintsHelloLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraintsHelloLabel()
    }

    
    private func setupView() {
        addSubview(helloWorld)
        
    }
    
    private func setupConstraintsHelloLabel() {
        let constraint = [
        helloWorld.centerXAnchor.constraint(equalTo: centerXAnchor),
        helloWorld.centerYAnchor.constraint(equalTo: centerYAnchor)
    
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    
    
}
