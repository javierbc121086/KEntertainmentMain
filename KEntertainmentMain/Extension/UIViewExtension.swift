//
//  UIViewExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

extension UIView {
    
    func constraints(to childView: UIView, constant: CGFloat = 0.0) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.leftAnchor.constraint(equalTo: leftAnchor, constant: constant).isActive = true
        childView.rightAnchor.constraint(equalTo: rightAnchor, constant: -constant).isActive = true
        childView.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        childView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant).isActive = true
    }
}
