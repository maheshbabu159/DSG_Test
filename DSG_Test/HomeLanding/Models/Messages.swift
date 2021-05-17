//
//  Messages.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
struct Messages : Codable {
	let text : String?

	enum CodingKeys: String, CodingKey {

		case text = "text"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		text = try values.decodeIfPresent(String.self, forKey: .text)
	}

}
