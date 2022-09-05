//
//  HomeView.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 05/09/22.
//

import UIKit

class HomeView: UIView {
    
    
    // MARK: - Private Properties
    
    lazy var HomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "HOME"
        label.textColor = UIColor(red: 0.012, green: 0.02, blue: 0.016, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 40)
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

extension HomeView: ViewCodable {
    
    func setupView() {
        backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        addSubview(HomeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            HomeLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            HomeLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
}
