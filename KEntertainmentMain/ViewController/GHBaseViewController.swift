//
//  GHBaseViewController.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

class GHBaseViewController: UIViewController, GHBaseViewControllerDelegate {
    
    var bundle: GHBundleParameters?
    var viewControllerType: GHViewControllerType?
    var helperControllerManager: GHHelperControllerManager?
    
    func processFailWithError(error: Error) { }
    
    func removeReferenceContext() {
        self.bundle = nil
        self.viewControllerType = nil
        self.helperControllerManager = nil
    }
}
