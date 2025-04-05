//
//  WorkOutEntity.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

struct WorkoutEntity: Decodable {
	let date: String
	let strength: StrengthEntity?
	let wod: WODEntity
}

struct StrengthEntity: Decodable {
	let description: [String]
}

struct WODEntity: Decodable {
	let title: String
	let timecap: Int
	let scaleRxdDescription: [String]
	let scaleADescription: [String]
	let scaleBDescription: [String]
}

