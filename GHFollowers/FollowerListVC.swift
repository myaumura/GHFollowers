//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Kirill Gusev on 24.04.2023.
//

import UIKit


class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
}
