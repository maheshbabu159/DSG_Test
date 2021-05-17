//
//  ApiConstants.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation

// MARK: - API Constants
public var client_id = "MjE5MjIzMTV8MTYyMTAwODE4OC4xOTkxMzM0"
public var search_api = "https://api.seatgeek.com/2/events?client_id=%@&q"

// MARK: - WebServiceUrlEndpoint
enum WebServiceUrlEndpoint {
    case getSearchApi(withSearchString: String)
    func url() -> String {
        switch self {
        case .getSearchApi(let searchString):
            return String(format: search_api + "=%@",client_id,searchString)
        }
    }
}
