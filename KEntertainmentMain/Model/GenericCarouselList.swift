//
//  GenericCarouselList.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

class GenericCarouselList: NSObject {
    var titleSection: String = .Empty
    var list: [ModelCollectionDelegate]
    
    init(list: [ModelCollectionDelegate], titleSection: String) {
        self.list = list
        self.titleSection = titleSection
    }
}
