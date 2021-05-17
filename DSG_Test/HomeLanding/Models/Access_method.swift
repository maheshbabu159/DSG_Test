//
//  Access_method.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
struct Access_method : Codable {
	let method : String?
	let created_at : String?
	let employee_only : Bool?

	enum CodingKeys: String, CodingKey {

		case method = "method"
		case created_at = "created_at"
		case employee_only = "employee_only"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		method = try values.decodeIfPresent(String.self, forKey: .method)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		employee_only = try values.decodeIfPresent(Bool.self, forKey: .employee_only)
	}

}
