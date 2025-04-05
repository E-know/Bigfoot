//
//  WorkoutModel.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import Foundation

struct WorkoutModel {
//	let date: Date
	let strength: StrengthDomain
	let wod: WODDomain
}

struct StrengthDomain: Decodable {
	let description: [String]
}

struct WODDomain: Decodable {
	let title: String
	let timecap: Int
	let scaleRxdDescription: [String]
	let scaleADescription: [String]
	let scaleBDescription: [String]
}

extension WorkoutEntity {
	func toDomain() -> WorkoutModel {
		let strengthDomain = StrengthDomain(description: self.strength.description)
		let wodDomain = WODDomain(
			title: self.wod.title,
			timecap: self.wod.timecap,
			scaleRxdDescription: self.wod.scaleRxdDescription,
			scaleADescription: self.wod.scaleADescription,
			scaleBDescription: self.wod.scaleBDescription
		)
		
		return WorkoutModel(strength: strengthDomain, wod: wodDomain)
	}
}
