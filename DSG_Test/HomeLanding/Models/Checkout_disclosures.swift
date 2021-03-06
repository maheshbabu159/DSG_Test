//
//  Checkout_disclosures.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
struct Checkout_disclosures : Codable {
	let messages : [Messages]?

	enum CodingKeys: String, CodingKey {

		case messages = "messages"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		messages = try values.decodeIfPresent([Messages].self, forKey: .messages)
	}

}
