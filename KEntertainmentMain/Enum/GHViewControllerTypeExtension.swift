//
//  GHViewControllerTypeExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

extension GHViewControllerType {
    
    func getViewControllerClass() -> UIViewController.Type {
        var nameClass = UIViewController.self
        
        switch self {
        case .dashboard:
            nameClass = KDashboardViewController.self
        case .detail:
            nameClass = KDetailViewController.self
            break
        }
        
        return nameClass
    }
    
    func getStoryboard() -> String {
        var nameStoryboard = String.Empty
        
        switch self {
        case .dashboard, .detail:
            nameStoryboard = "Dashboard"
            break
        }
        
        return nameStoryboard
    }
}
