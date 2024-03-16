//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by Kirill Gusev on 16.04.2023.
//

import UIKit

final class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "FAVORITES_LIST_VIEW"
        view.backgroundColor = .systemBackground
    }
}
