//
//  KDashboardViewController.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit
import KEntertainmentProcess

class KDashboardViewController: GHBaseViewController {

    @IBOutlet weak var containerListView: UIView!
    @IBOutlet weak var listActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var listSearchBar: UISearchBar! {
        didSet {
            listSearchBar.delegate = self
            listSearchBar.searchTextField.clearButtonMode = .never
        }
    }
    
    private var _entertainmentProcess: KEntertainmentProcess?
    lazy var genericList = GenericSectionTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _entertainmentProcess = KEntertainmentProcess()
        _entertainmentProcess?.delegate = self
        
        _entertainmentProcess?.getListEntertainment()
    }
    
    override func removeReferenceContext() {
        self.genericList.removeReferenceContext()
        
        _entertainmentProcess?.removeReferenceContext()
        _entertainmentProcess = nil
        
        super.removeReferenceContext()
    }
}
