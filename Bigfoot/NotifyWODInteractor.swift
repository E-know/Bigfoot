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
	}
	
	func changeWODScale(scale: NotifyWODModels.WODScale) {
		withAnimation(.spring) {
			viewModel?.scale = scale
		}
	}
}
