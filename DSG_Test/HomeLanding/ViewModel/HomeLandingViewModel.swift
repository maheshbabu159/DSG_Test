//
//  HomeLandingViewModel.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
class HomeLandingViewModel: NSObject {
    var apiManager: APIManager!
    init(apimanager: APIManager) {
        self.apiManager = apimanager
        super.init()
    }
    var searchResults: SearchResults?
    func getSearchResults(withSearchString: String, completion: @escaping (_ result: SearchResults?, _ status: Bool, _ error: String?) -> ()) {
        apiManager.getSearchResultsWith(searchString: withSearchString) { (responce, status, error) in
            if status {
                self.searchResults = responce
                completion(responce, status, nil)
            } else {
                completion(nil, status, error)
            }
        }
        
    }
}
