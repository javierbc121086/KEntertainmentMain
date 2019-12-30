//
//  CollectionCellDelegate.swift
//  Generic
//
//  Created by Javier Bolaños on 10/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

protocol ModelCollectionDelegate {
    var ReuseIdentifier: String { get }
    var SizeForItem: CGSize { get }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> CollectionViewCellDelegate?
}

extension ModelCollectionDelegate {
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> CollectionViewCellDelegate? {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.ReuseIdentifier,
                                                      for: indexPath) as? CollectionViewCellDelegate
        if cell == nil {
            let nib = Bundle.main.loadNibNamed(self.ReuseIdentifier, owner: collectionView, options: nil)
            cell = nib?[0] as? CollectionViewCellDelegate
        }
        
        return cell
    }
}
