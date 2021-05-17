//
//  ApiManager.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
class APIManager {
    static let shared = APIManager()
    init() {}
    /**
     This method is to fetch the search results from server using search string
     - Parameter searchString: value to search
     */
    func getSearchResultsWith(searchString: String, completion: @escaping (_ result: SearchResults?, _ status: Bool, _ error: String?) -> ()) {
        WebServices.shared.getRequest(url: WebServiceUrlEndpoint.getSearchApi(withSearchString: searchString).url(),
                                      onSuccess: { data in
                                        let jsonDecoder = JSONDecoder()
                                        do {
                                            let responseModel = try jsonDecoder.decode(SearchResults.self, from: data!)
                                            print(responseModel)
                                            completion(responseModel, true, nil)
                                        } catch let error {
                                            print(error.localizedDescription)
                                        }
                                      },onClientError: { (Error) in
                                        print("A network error occurred. Please try again later")
                                        completion(nil, false, Error.localizedDescription)
                                      },
                                      onServerError: { (HTTPURLResponse, errorData: Data?) in
                                        print("A network error occurred. Please try again later")
                                        completion(nil, false,"A network error occurred. Please try again later")
                                      })
    }
    
}
