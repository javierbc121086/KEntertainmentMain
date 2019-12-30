//
//  TableCellDelegate.swift
//  Generic
//
//  Created by Javier Bolaños on 10/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

protocol ModelTableDelegate {
    var TitleSection: String { get set }
    var ReuseIdentifier: String { get }
    var HeightForRow: CGFloat { get }
    
    func cellForTableView(tableView: UITableView, atIndexPath: IndexPath) -> TableViewCellDelegate?
}

extension ModelTableDelegate {
    func cellForTableView(tableView: UITableView, atIndexPath: IndexPath) -> TableViewCellDelegate? {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.ReuseIdentifier, for: atIndexPath) as? TableViewCellDelegate
        
        if cell == nil {
            let nib = Bundle.main.loadNibNamed(self.ReuseIdentifier, owner: tableView, options: nil)
            cell = nib?[0] as? TableViewCellDelegate
        }
        
        return cell
    }
}
