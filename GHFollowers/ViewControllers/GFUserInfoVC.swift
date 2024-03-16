//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Kirill Gusev on 31.01.2024.
//

import UIKit

class UserInfoVC: UIViewController {

    private let headerView = UIView()
    
    private var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
        
        setupUI()
    }

    private func setupUI() {
        view.addSubview(headerView)
        
        headerView.backgroundColor = .systemMint
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
