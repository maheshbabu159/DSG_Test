//
//  In_hand.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
struct In_hand : Codable {
    let in_hand : String?
	enum CodingKeys: String, CodingKey {
        case in_hand = "in_hand"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        in_hand = try values.decodeIfPresent(String.self, forKey: .in_hand)
	}

}
