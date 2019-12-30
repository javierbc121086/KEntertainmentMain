//
//  GHHelperControllerManager.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

class GHHelperControllerManager: NSObject {
    
    private lazy var viewControllers: [GHViewControllerType: GHBaseViewControllerDelegate?] = [:]
    private var _navigationController: UINavigationController?
    
    var navigationController: UINavigationController? {
        get { return _navigationController }
        set { _navigationController = newValue }
    }
 
    func hideViewController(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
        
        if let key = getLastVCPresented()?.key {
            self.releaseVcFromName(name: key)
        }
    }
    
    func presentDefaultNavigationViewController(name: GHViewControllerType, navHidden: Bool = true) {
        self.viewControllers
            .filter { $0.key != name }
            .forEach { self.releaseVcFromName(name: $0.key) }
        
        if let contrll = self.viewControllers.first?.value as? GHBaseViewController {
            contrll.bundle?.releaseSource()
            self.setNavBarHiden(hidden: navHidden)
            self.navigationController?.popToViewController(viewController: contrll, animated: true, completion: { })
        }
    }
    
    func presentNavigationViewController(name: GHViewControllerType, bundle: GHBundleParameters? = nil) {
        if let _ = name.getViewControllerClass() as? GHBaseViewControllerDelegate.Type {
            
            if self.viewControllers[name] == nil {
                let storyboard = UIStoryboard(name: name.getStoryboard(), bundle: nil)
                
                if let description = name.getViewControllerClass().description().split(separator: ".").last {
                    if var instanceVC = storyboard.instantiateViewController(
                            withIdentifier: String(description)
                        ) as? GHBaseViewControllerDelegate {
                        
                        instanceVC.bundle = bundle
                        instanceVC.viewControllerType = name
                        instanceVC.helperControllerManager = self
                        
                        self.viewControllers[name] = instanceVC
                    }
                }
            }
            
            if let contrll = self.viewControllers[name] as? UIViewController {
                self.navigationController?.pushViewController(viewController: contrll, animated: true) { }
            }
        }
    }
    
    private var getAllViewsController: [GHViewControllerType : GHBaseViewControllerDelegate?] {
        return self.viewControllers
    }
    
    private func getVcFromName(name: GHViewControllerType) -> GHBaseViewControllerDelegate? {
        return self.viewControllers[name] ?? nil
    }
    
    private func getLastVCPresented() -> (key: GHViewControllerType, value: GHBaseViewControllerDelegate?)? {
        let elements = self.viewControllers.count
        
        if elements > 1 {
            return self.viewControllers.sorted(
                by: { (first: (key: GHViewControllerType, value: GHBaseViewControllerDelegate?),
                last: (key: GHViewControllerType, value: GHBaseViewControllerDelegate?)) -> Bool in
                
                    return first.key.rawValue < last.key.rawValue
                
            }).last
        }
        
        return nil
    }
    
    private func releaseVcFromName(name: GHViewControllerType) {
        self.viewControllers[name]??.removeReferenceContext()
        self.viewControllers[name] = nil
        _ = self.viewControllers.removeValue(forKey: name)
    }
}
