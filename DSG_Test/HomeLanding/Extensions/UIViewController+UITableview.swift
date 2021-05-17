//
//  UIViewController+UITableview.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResults?.events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSearchCell, for: indexPath) as! SeachResultsTableViewCell
        if let event = viewModel.searchResults?.events?[indexPath.row] {
            cell.searhEvent = event
        }
        cell.selectionStyle = .none
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let event = viewModel.searchResults?.events?[indexPath.row] {
            let detailsVc = self.storyboard?.instantiateViewController(identifier: "HomeDetailsViewController") as! HomeDetailsViewController
            detailsVc.searhEvent = event
            self.navigationController?.pushViewController(detailsVc, animated: true)
        }
    }
}
