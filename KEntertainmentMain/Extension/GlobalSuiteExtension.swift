//
//  GlobalSuiteExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

import Foundation
import UIKit

public extension CharacterSet {
    
    static let urlQueryParameterAllowed = CharacterSet.urlQueryAllowed.subtracting(CharacterSet(charactersIn: "&?"))
    
    static let urlQueryDenied           = CharacterSet.urlQueryAllowed.inverted()
    static let urlQueryKeyValueDenied   = CharacterSet.urlQueryParameterAllowed.inverted()
    static let urlPathDenied            = CharacterSet.urlPathAllowed.inverted()
    static let urlFragmentDenied        = CharacterSet.urlFragmentAllowed.inverted()
    static let urlHostDenied            = CharacterSet.urlHostAllowed.inverted()
    
    static let urlDenied                = CharacterSet.urlQueryDenied
        .union(.urlQueryKeyValueDenied)
        .union(.urlPathDenied)
        .union(.urlFragmentDenied)
        .union(.urlHostDenied)
    
    
    func inverted() -> CharacterSet {
        var copy = self
        copy.invert()
        return copy
    }
}

public extension String {
    func urlEncoded(denying deniedCharacters: CharacterSet = .urlDenied) -> String? {
        return addingPercentEncoding(withAllowedCharacters: deniedCharacters.inverted())
    }
}

extension UINavigationController {
    
    /*
     Get previous view controller of the navigation stack.
     - returns:
     El ViewController anterior.
     */
    func previousViewController() -> UIViewController?{
        let lenght = self.viewControllers.count
        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght-2] : nil
        return previousViewController
    }
    
    
    /// Lanza el pushviewController con un completition.
    ///
    /// - Parameters:
    ///   - viewController: View controller destino.
    ///   - animated: true/false si es animado.
    ///   - completion: El metodo a ejecutar cuando se complete la transaccion.
    func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> ()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    /**
     Lanza el pushviewController con un completition.
     */
    func popToViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> ()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    /**
     Lanza el pushviewController con un completition.
     */
    func popViewController(animated: Bool, completion: @escaping () -> ()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: true)
        CATransaction.commit()
    }
}

extension Sequence {
    public func groupBy<T: Hashable>(_ keyFunc: (Iterator.Element) -> T) -> [T: [Iterator.Element]] {
        var dict: [T: [Iterator.Element]] = [:]
        for el in self {
            let key = keyFunc(el)
            if case nil = dict[key]?.append(el) { dict[key] = [el] }
        }
        return dict
    }
}

extension UIViewController {
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            //statusBar.backgroundColor = style == .lightContent ? UIColor.black : .white
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
}

extension UIColor {
    @nonobjc class var pinkyRed: UIColor {
        return UIColor(red: 1.0, green: 30.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var paleGrey: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var trueBlue: UIColor {
        return UIColor(red: 0.0, green: 0.0, blue: 187.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var lightGreenishBlue: UIColor {
        return UIColor(red: 102.0 / 255.0, green: 1.0, blue: 204.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var steel: UIColor {
        return UIColor(red: 129.0 / 255.0, green: 133.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var charcoalGrey: UIColor {
        return UIColor(red: 67.0 / 255.0, green: 69.0 / 255.0, blue: 75.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var blueyGrey: UIColor {
        return UIColor(red: 148.0 / 255.0, green: 152.0 / 255.0, blue: 158.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var veryLightBlue: UIColor {
        return UIColor(red: 233.0 / 255.0, green: 235.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var titleBlack: UIColor {
        return UIColor(red: 37.0 / 255.0, green: 37.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0)
    }
    
    class Colors {
        var gl:CAGradientLayer!
        
        init() {
            let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
            
            self.gl = CAGradientLayer()
            self.gl.colors = [colorTop, colorBottom]
            self.gl.locations = [0.0, 1.0]
        }
    }
}

extension UIFont {
    class var titulos: UIFont {
        return UIFont.systemFont(ofSize: 24.0, weight: .regular)
    }
    class var button: UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: .regular)
    }
    class var campos: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .regular)
    }
    class var minitext: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    class var textStyle: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
}
