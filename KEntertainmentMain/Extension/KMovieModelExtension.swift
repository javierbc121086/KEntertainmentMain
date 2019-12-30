//
//  KMovieModelImageExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit
import KEntertainmentDomain

public protocol KMovieCellDelegate {
    func image(image: UIImage)
}

extension KMovieModel: ModelCollectionDelegate {
    var ReuseIdentifier: String {
        return CollectionCellType.verticalCell.rawValue
    }
    
    var SizeForItem: CGSize {
        return CGSize(width: 120, height: 226)
    }
}

extension KMovieModel {
    
    public var PosterImage: UIImage? {
        get {
            return self.cacheData as? UIImage
        }
        set {
            self.cacheData = newValue
        }
    }
}
