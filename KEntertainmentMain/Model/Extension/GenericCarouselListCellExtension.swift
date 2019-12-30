//
//  GenericCarouselListCellExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

extension GenericCarouselList: ModelTableDelegate {
    var TitleSection: String {
        get {
            return self.titleSection
        }
        set {
            self.titleSection = newValue
        }
    }
    
    var HeightForRow: CGFloat {
        return 240.0
    }
    
    var ReuseIdentifier: String {
        return TableCellType.verticalClasicCell.rawValue
    }
}
