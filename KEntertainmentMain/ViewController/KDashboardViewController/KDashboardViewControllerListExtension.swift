//
//  KDashboardViewControllerListExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

extension KDashboardViewController: GenericCollectionViewControllerDelegate {
    func modelSelected(model: ModelCollectionDelegate) {
        self.bundle = self.bundle ?? GHBundleParameters()
        self.bundle?.add(model, key: "kmodel")
        self.helperControllerManager?.presentNavigationViewController(name: .detail, bundle: self.bundle)
    }
}
