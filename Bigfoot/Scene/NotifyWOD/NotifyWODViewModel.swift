//
//  NotifyWODModel.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import SwiftUI

protocol NotifyWODViewModelProtocol: AnyObject {
	var workoutInfo: [WorkoutViewModel] { get set }
}

@Observable
final class NotifyWODViewModel: NotifyWODViewModelProtocol {
	var workoutInfo: [WorkoutViewModel] = []
}


struct NotifyWODPresnter {
    weak var viewModel: NotifyWODViewModelProtocol?
    
    init(viewModel: NotifyWODViewModelProtocol?) {
        self.viewModel = viewModel
    }
    
    func updateWorkoutInfo(_ workoutInfo: [WorkoutModel]) {
        let workoutViewModel = workoutInfo.map { $0.toViewModel() }
        viewModel?.workoutInfo = workoutViewModel
    }
}
