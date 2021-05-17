//
//  Images.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
struct Images : Codable {
	let huge : String?

	enum CodingKeys: String, CodingKey {

		case huge = "huge"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		huge = try values.decodeIfPresent(String.self, forKey: .huge)
	}

}
