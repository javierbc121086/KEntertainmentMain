//
//  GHBaseViewControllerDelegate.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

protocol GHBaseViewControllerDelegate {
    var bundle: GHBundleParameters? { get set }
    var viewControllerType: GHViewControllerType? { get set }
    var helperControllerManager: GHHelperControllerManager? { get set }
    
    func removeReferenceContext()
}
