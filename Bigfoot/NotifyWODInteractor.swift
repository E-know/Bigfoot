//
//  NotifyWODInteractor.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import SwiftUI

protocol NotifyWODInteractorProtocol {
	func changeWODScale(scale: NotifyWODModels.WODScale)
}

struct NotifyWODInteractor: NotifyWODInteractorProtocol {
	weak var viewModel: NotifyWODDomainModelProtocol?
	
	init(viewModel: NotifyWODDomainModelProtocol) {
		self.viewModel = viewModel
		
		Task { [self] in
			let worker = NotifyWODWorker()
			let workoutInfo = try await worker.workoutInformation()
			self.viewModel?.workoutInfo = workoutInfo
		}
	}
	
	func changeWODScale(scale: NotifyWODModels.WODScale) {
		withAnimation(.spring) {
			viewModel?.scale = scale
		}
	}
}
