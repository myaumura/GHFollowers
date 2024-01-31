//
//  GFColumnFlowLayout.swift
//  GHFollowers
//
//  Created by Kirill Gusev on 03.10.2023.
//

import UIKit

final class GFColumnFlowLayout: UICollectionViewFlowLayout {
    
    init(in view: UIView) {
        super.init()
        configure(in: view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(in view: UIView) {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availiableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availiableWidth / 3
        
        sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
    }
}
