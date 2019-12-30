//
//  KDashboardViewControllerSearchExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

extension KDashboardViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText: searchText)
        searchBar.setShowsCancelButton(!searchText.isEmpty, animated: true)
        if searchText.isEmpty {
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.filterContentForSearchText(searchText: String.Empty)
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = String.Empty
        searchBar.resignFirstResponder()
    }
    
    fileprivate func filterContentForSearchText(searchText: String) {
        self.genericList.setFilterSource(searchText: searchText)
    }
}
