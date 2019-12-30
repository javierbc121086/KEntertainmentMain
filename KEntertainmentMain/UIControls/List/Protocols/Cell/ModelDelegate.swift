//
//  ReplaceCardModelDelegate.swift
//  Generic
//
//  Created by Javier Bolaños on 10/15/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

/**
 UITableViewCell
 */
protocol TableViewCellDelegate {
    func drawCell(model: ModelTableDelegate, delegate: GenericCollectionViewControllerDelegate?)
}

/**
UICollectionViewCell
*/
protocol CollectionViewCellDelegate {
    func drawCell(model: ModelCollectionDelegate)
}
