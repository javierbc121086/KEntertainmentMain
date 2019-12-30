//
//  KDashboardViewControllerProcessExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit
import KEntertainmentProcess
import KEntertainmentDomain

extension KDashboardViewController: KEntertainmentProcessDelegate {
    func dataResponseProcess(list: [KEntertainmentModel]) {
        DispatchQueue.main.async(execute: {
            if self.listActivityIndicator.isAnimating {
                self.listActivityIndicator.stopAnimating()
            }
            
            var listTable: [ModelTableDelegate] = []
            
            list.forEach { item in
                if let movieList = item.list as? [KMovieModel] {
                    listTable.append(GenericCarouselList(list: movieList, titleSection: item.type.getTitle()))
                }
                else if let tvList = item.list as? [KTvModel] {
                    listTable.append(GenericCarouselList(list: tvList, titleSection: item.type.getTitle()))
                }
            }
            
            self.genericList.setSource(listSource: listTable)
            
            if !self.genericList.tableView.isDescendant(of: self.containerListView) {
                self.genericList.itemDelegate = self
                if let table = self.genericList.tableView {
                    self.containerListView.addSubview(table)
                    self.containerListView.constraints(to: table)
                }
            }
        })
    }
}
