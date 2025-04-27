//
//  WorkoutViewModel.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/27/25.
//

import Foundation

struct WorkoutViewModel: Hashable {
    let dateString: String
    let strength: StrengthViewModel?
    let wod: WODViewModel
    let selectedScale: NotifyWODModels.WODScale
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.dateString == rhs.dateString
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dateString)
    }
}

extension WorkoutModel {
    func toViewModel() -> WorkoutViewModel {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"  // 원하는 형식
        formatter.locale = Locale(identifier: "ko_KR") // 로케일 설정

        return .init(
            dateString: formatter.string(from: date),
            strength: strength?.toViewModel(),
            wod: wod.toViewModel(scale: self.selectedScale),
            selectedScale: selectedScale
        )
    }
}

struct StrengthViewModel {
    let description: [String]
}

extension StrengthDomain {
    func toViewModel() -> StrengthViewModel {
        .init(description: description)
    }
}

struct WODViewModel {
    let title: String
    let timecap: Int
    let description: [String]
}

extension WODDomain {
    func toViewModel(scale: NotifyWODModels.WODScale) -> WODViewModel {
        let description = switch scale {
            case .Rxd:
                scaleRxdDescription
            case .A:
                scaleADescription
            case .B:
                scaleBDescription
        }
        
        return .init(
            title: title,
            timecap: timecap,
            description: description
        )
    }
}
