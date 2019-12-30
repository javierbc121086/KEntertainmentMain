//
//  GenericSectionTableViewController.swift
//  Generic
//
//  Created by Javier Bolaños on 11/5/19.
//  Copyright © 2019 ironbit. All rights reserved.
//

import UIKit
import KEntertainmentDomain

class GenericSectionTableViewController: UITableViewController {
    
    var itemDelegate: GenericCollectionViewControllerDelegate?
    
    private var listSource: [ModelTableDelegate?]?
    private var filteredlistSource: [ModelTableDelegate?]?
    
    private lazy var dcViewHeades: [String: UIView] = [:]
    private var heightForHeader: CGFloat = 45.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableCellType.getList.forEach { element in
            let nib = UINib(nibName: element, bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: element)
        }
        
        self.tableView.backgroundColor = .clear
        
        self.tableView.clipsToBounds = true
        
        self.tableView.isUserInteractionEnabled = true
        self.tableView.alwaysBounceVertical = false
        
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 272.0
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: TableViewCellDelegate?
        
        if let data = self.filteredlistSource?[indexPath.section] {
            cell = data.cellForTableView(tableView: tableView, atIndexPath: indexPath)
            cell?.drawCell(model: data, delegate: self.itemDelegate)
        }
        
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let data = self.filteredlistSource?[indexPath.section] {
            return data.HeightForRow.isEqual(to: 0.0)
                ? UITableView.automaticDimension
                : data.HeightForRow
        }
        
        return 0.0
    }
    
    override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    /**
     Section Delegates
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.filteredlistSource?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.filteredlistSource?[section]?.TitleSection
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.makeHeaderTableViewCell(title: self.filteredlistSource?[section]?.TitleSection)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if let title = self.filteredlistSource?[section]?.TitleSection, !title.isEmpty {
            return self.heightForHeader
        }
        
        return 0.0
    }
    
    /**
    Custom Source
    */
    func setSource(listSource: [ModelTableDelegate]) {
        self.listSource?.removeAll()
        self.listSource = nil
        self.listSource = listSource
        
        self.filteredlistSource?.removeAll()
        self.filteredlistSource = nil
        self.filteredlistSource = listSource
        
        self.tableView.reloadData()
    }
    
    func setFilterSource(searchText: String) {
        self.filteredlistSource?.removeAll()
        
        if searchText.isEmpty {
            self.filteredlistSource = self.listSource
        }
        else if let list = self.listSource, list.isNotEmpty {
            var listSource: [ModelTableDelegate] = []
            
            list.forEach {
                let tempList = ($0 as? GenericCarouselList)?.list.filter {
                    let matchMovieTitle = ($0 as? KMovieModel)?.title.lowercased().range(of: searchText.lowercased())
                    let matchTvName = ($0 as? KTvModel)?.name.lowercased().range(of: searchText.lowercased())
                    
                    if let title = matchMovieTitle {
                        return !title.isEmpty
                    }
                    
                    if let name = matchTvName {
                        return !name.isEmpty
                    }
                    
                    return false
                }
                
                if let tList = tempList, tList.isNotEmpty {
                    listSource.append(GenericCarouselList(list: tList,
                                                          titleSection: ($0 as? GenericCarouselList)?.titleSection ?? ""))
                }
            }
            
            self.filteredlistSource = listSource
        }
        
        self.tableView.reloadData()
    }
    
    /**
     Generic Functions
     */
    fileprivate func makeHeaderTableViewCell(title: String?) -> UIView? {
        guard let titleHeader = title, !titleHeader.isEmpty else {
            return nil
        }
        
        guard let headerView = self.dcViewHeades[titleHeader] else {
            let vHeader = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: self.heightForHeader))
            vHeader.backgroundColor = .clear
            
            let lblHeader = UILabel()
            lblHeader.font = .titulos
            lblHeader.textColor = .lightGray
            lblHeader.textAlignment = .left
            lblHeader.backgroundColor = .white
            lblHeader.numberOfLines = 0
            lblHeader.text = titleHeader
            
            vHeader.addSubview(lblHeader)
            vHeader.constraints(to: lblHeader)
            
            self.dcViewHeades[titleHeader] = vHeader
            
            return vHeader
        }
        
        return headerView
    }
    
    func removeReferenceContext() {
        self.listSource?.removeAll()
        self.listSource = nil
        
        self.filteredlistSource?.removeAll()
        self.filteredlistSource = nil
        
        self.dcViewHeades.removeAll()
        
        self.itemDelegate = nil
    }
}
