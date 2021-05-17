//
//  ViewController+UISearchBarDelegate.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
import UIKit

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Search
        print(searchText)
        self.fetchSearchResultsFromServer(searchString: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        self.fetchSearchResultsFromServer()
    }
    // Called when search bar obtains focus.  I.e., user taps
    // on the search bar to enter text.
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}
 
