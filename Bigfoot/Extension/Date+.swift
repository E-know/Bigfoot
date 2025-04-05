//
//  Date+.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/6/25.
//

import Foundation

extension Date {
	var dateString: String {
		let outputFormatter = DateFormatter()
	   outputFormatter.dateFormat = "yyyy년 MM월 dd일 EEEE" // 한국어 요일 포함 형식
	   outputFormatter.locale = Locale(identifier: "ko_KR")
		   
	   // 변환된 문자열 반환
	   return outputFormatter.string(from: self)
	}
	
	var debugDescription: String {
		let outputFormatter = DateFormatter()
	   outputFormatter.dateFormat = "yyyy년 MM월 dd일 EEEE HH시 mm분" // 한국어 요일 포함 형식
	   outputFormatter.locale = Locale(identifier: "ko_KR")
		   
	   // 변환된 문자열 반환
	   return outputFormatter.string(from: self)
	}
}
