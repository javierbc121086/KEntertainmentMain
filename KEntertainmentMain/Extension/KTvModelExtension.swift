//
//  KTvModelExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit
import KEntertainmentDomain

extension KTvModel: ModelCollectionDelegate {
    var ReuseIdentifier: String {
        return CollectionCellType.verticalCell.rawValue
    }
    
    var SizeForItem: CGSize {
        return CGSize(width: 120, height: 226)
    }
}

extension KTvModel {
    
    public var PosterImage: UIImage? {
        get {
            return self.cacheData as? UIImage
        }
        set {
            self.cacheData = newValue
        }
    }
}
