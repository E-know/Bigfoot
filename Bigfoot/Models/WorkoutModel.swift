//
//  WorkoutModel.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import Foundation

struct WorkoutModel: Hashable {
	let date: Date
	let strength: StrengthDomain?
	let wod: WODDomain
	
	init?(dateString: String, strength: StrengthDomain?, wod: WODDomain) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateFormatter.locale = Locale(identifier: "ko_KR") // 한국어 설정
		
		// 문자열을 Date 객체로 변환
		guard let date = dateFormatter.date(from: dateString) else { return nil }
		self.date = date
		self.strength = strength
		self.wod = wod
	}
	
	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.date.dateString == rhs.date.dateString
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(date)
	}
}

struct StrengthDomain {
	let description: [String]
}

struct WODDomain {
	let title: String
	let timecap: Int
	let scaleRxdDescription: [String]
	let scaleADescription: [String]
	let scaleBDescription: [String]
	
	func description(scale: NotifyWODModels.WODScale) -> [String] {
		switch scale {
			case .Rxd:
				self.scaleRxdDescription
			case .A:
				self.scaleADescription
			case .B:
				self.scaleBDescription
		}
	}
}

extension WorkoutEntity {
	func toDomain() -> WorkoutModel? {
		let strengthDomain: StrengthDomain? = if let strength {
			StrengthDomain(description: strength.description)
		} else {
			nil
		}
		
		let wodDomain = WODDomain(
			title: self.wod.title,
			timecap: self.wod.timecap,
			scaleRxdDescription: self.wod.scaleRxdDescription,
			scaleADescription: self.wod.scaleADescription,
			scaleBDescription: self.wod.scaleBDescription
		)
		
		return WorkoutModel(dateString: self.date,strength: strengthDomain, wod: wodDomain)
	}
}

