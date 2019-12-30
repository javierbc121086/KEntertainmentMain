//
//  TableCellType.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 10/31/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import Foundation

enum TableCellType: String {
    case verticalClasicCell = "KVerticalContainerTableViewCell"
}

extension TableCellType {
    static var getList: [String] {
        return [verticalClasicCell.rawValue]
    }
}
