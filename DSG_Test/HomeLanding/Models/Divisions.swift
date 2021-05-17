//
//  Divisions.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
struct Divisions : Codable {
	let taxonomy_id : Int?
	let short_name : String?
	let display_name : String?
	let display_type : String?
	let division_level : Int?
	let slug : String?

	enum CodingKeys: String, CodingKey {

		case taxonomy_id = "taxonomy_id"
		case short_name = "short_name"
		case display_name = "display_name"
		case display_type = "display_type"
		case division_level = "division_level"
		case slug = "slug"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		taxonomy_id = try values.decodeIfPresent(Int.self, forKey: .taxonomy_id)
		short_name = try values.decodeIfPresent(String.self, forKey: .short_name)
		display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
		display_type = try values.decodeIfPresent(String.self, forKey: .display_type)
		division_level = try values.decodeIfPresent(Int.self, forKey: .division_level)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
	}

}
