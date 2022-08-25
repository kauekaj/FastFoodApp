//
//  ViewCodable.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 25/08/22.
//

public protocol ViewCodable: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

public extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func buildViewHierarchy() {}

    func setupConstraints() {}

    func setupAdditionalConfiguration() {}
}
