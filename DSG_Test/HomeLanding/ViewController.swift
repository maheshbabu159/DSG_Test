//
//  ViewController.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    let kSearchCell = "SeachResultsTableViewCell"
    let viewModel = HomeLandingViewModel(apimanager: APIManager.shared)

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = searchBar
        self.customiseSearchbar()
        self.searchBar.delegate = self
        self.searchTableView.register(UINib(nibName: kSearchCell, bundle: nil), forCellReuseIdentifier: kSearchCell)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.fetchSearchResultsFromServer()
    }
    func fetchSearchResultsFromServer(searchString: String = "") {
        LoadingOverlay.shared.showOverlay(view: self.searchTableView)
        self.viewModel.getSearchResults(withSearchString: searchString) { (responce, status, error) in
            LoadingOverlay.shared.hideOverlayView()
            if status {
                self.searchTableView.reloadData()
            } else {
                self.showAlertMessage(message: error ?? "")
            }
        }
    }
    private func customiseSearchbar() {
        self.searchBar.searchTextField.backgroundColor = .black
        self.searchBar.searchTextField.leftView?.tintColor = .lightGray
        self.searchBar.searchTextField.textColor = .white
    }

}

