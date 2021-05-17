//
//  MockApiManager.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
@testable import DSG_Test

class MockAPIManager: APIManager {

    static let sharedManager = MockAPIManager()
    private override init() {
        super.init()
    }
    func getSearchResultsWith(searchString: String, completion: @escaping (SearchResults?, Bool, String?) -> ()) {
        if let path = Bundle.main.path(forResource: "HomeLandingMockData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                do {
                    let responseModel = try jsonDecoder.decode(SearchResults.self, from: data)
                    completion(responseModel, true, nil)
                } catch let error {
                    print(error.localizedDescription)
                }
            } catch {}
        }
    }
    
   
}
