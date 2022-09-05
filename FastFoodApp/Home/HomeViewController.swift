//
//  HomeViewController.swift
//  FastFoodApp
//
//  Created by Kaue de Assis Jacyntho on 05/09/22.
//

import UIKit


class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    
    override func loadView() {
        super.loadView()
        
        homeView = .init()
        view = homeView
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
