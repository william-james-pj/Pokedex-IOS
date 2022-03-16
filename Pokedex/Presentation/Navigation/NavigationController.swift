//
//  NavigationController.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 13/03/22.
//

import UIKit

public class NavigationController: UINavigationController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    private func setupNavBar() {
        guard let navbar = self.navigationController?.navigationBar else {return}
        
        navbar.isTranslucent = true
        navbar.backgroundColor = .clear
        navbar.tintColor = .black
    }
}
