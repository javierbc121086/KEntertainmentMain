//
//  CollectionCellType.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 10/31/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import Foundation

enum CollectionCellType: String {
    case verticalCell = "KVerticalCollectionViewCell"
}

extension CollectionCellType {
    static var getList: [String] {
        return [verticalCell.rawValue]
    }
}
