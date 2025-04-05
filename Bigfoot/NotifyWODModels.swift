//
//  NotifyWODModels.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import SwiftUI

struct NotifyWODModels {
	enum WODScale: String, CaseIterable {
		case Rxd = "Rx'd"
		case A = "A"
		case B = "B"
		
		var fontColor: Color {
			switch self {
				case .Rxd:
					return Color.rxdFont
				case .A:
					return Color.aFont
				case .B:
					return Color.bFont
			}
		}
		
		var backgroundColor: Color {
			switch self {
				case .Rxd:
					return Color.rxdBackground
				case .A:
					return Color.aBackground
				case .B:
					return Color.bBackground
			}
		}
	}
}
