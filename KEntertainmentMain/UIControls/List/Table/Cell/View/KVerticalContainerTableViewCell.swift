//
//  KVerticalContainerTableViewCell.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

class KVerticalContainerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    lazy var genericCollectionView = GenericCollectionViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if !self.genericCollectionView.collectionView.isDescendant(of: self.containerView) {
            if let coll = self.genericCollectionView.collectionView {
                self.containerView.addSubview(coll)
                self.containerView.constraints(to: coll)
            }
        }
    }
}

extension KVerticalContainerTableViewCell: TableViewCellDelegate {
    func drawCell(model: ModelTableDelegate, delegate: GenericCollectionViewControllerDelegate?) {
        if let carouselModel = model as? GenericCarouselList {
            self.genericCollectionView.setSource(list: carouselModel.list)
        }
        
        if self.genericCollectionView.collectionDelegate == nil {
            self.genericCollectionView.collectionDelegate = delegate
        }
    }
}
