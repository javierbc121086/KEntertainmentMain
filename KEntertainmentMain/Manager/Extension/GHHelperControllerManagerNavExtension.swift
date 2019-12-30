//
//  GHHelperControllerManagerNavExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

extension GHHelperControllerManager {
    
    func setNavBarHiden(hidden: Bool) {
        self.navigationController?.setNavigationBarHidden(hidden, animated: true)
    }
    
    func setCustomBackgroundNavigationBar(color: UIColor, font: UIFont) {
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.toolbar.tintColor          = color
        self.navigationController?.toolbar.barTintColor       = color
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.largeTitleTextAttributes = [
                .foregroundColor: color,
                .font: font
            ]
        }
        else {
            debugPrint("Fallback on earlier versions")
        }
    }
    
    func setCustomNavigationBarStyle(nav: UINavigationController?) {
        self.navigationController = nav
        
        self.navigationController?.navigationBar.barStyle     = .default
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.shadowImage          = UIImage(named: "fix_back")
        self.navigationController?.navigationBar.isTranslucent        = false
        self.navigationController?.navigationBar.isOpaque             = false
        
        self.navigationController?.toolbar.tintColor          = .white
        self.navigationController?.toolbar.barTintColor       = .white
        self.navigationController?.toolbar.isOpaque           = false
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func addNavButtonLeft(leftButtonItem: UIBarButtonItem) {
        self.navigationController?.navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    func addNavButtonLeftWhitButton(items: [UIBarButtonItem]) {
        self.navigationController?.navigationItem.leftBarButtonItems = items
    }
    
    func addNavButtonRight(rightButtonItem: UIBarButtonItem) {
        self.navigationController?.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    func addNavImageButtonRight(items: [UIBarButtonItem]) {
        self.navigationController?.navigationItem.rightBarButtonItems = items
    }
}
