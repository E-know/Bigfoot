//
//  NotifyWODModel.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import SwiftUI

protocol NotifyWODDomainModelProtocol: AnyObject {
	var scale: NotifyWODModels.WODScale { get set }
	var workoutInfo: [WorkoutModel] { get set }
}

@Observable
final class NotifyWODDomainModel: NotifyWODDomainModelProtocol {
	var scale: NotifyWODModels.WODScale = .Rxd
	var workoutInfo: [WorkoutModel] = [] {
		didSet {
			print(workoutInfo)
		}
	}
}
