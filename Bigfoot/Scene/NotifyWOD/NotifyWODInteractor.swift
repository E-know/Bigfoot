//
//  NotifyWODInteractor.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import SwiftUI

protocol NotifyWODInteractorProtocol {
    mutating func changeWODScale(index: Int, scale: NotifyWODModels.WODScale)
}


final class NotifyWODInteractor: NotifyWODInteractorProtocol {
    var presenter: NotifyWODPresnter
    
    var workoutInfo: [WorkoutModel] = [] {
        didSet {
            presenter.updateWorkoutInfo(workoutInfo)
        }
    }
    
    init(presenter: NotifyWODPresnter) {
        self.presenter = presenter
    }
    
    func fetchWorkoutInfo() async throws {
        let worker = NotifyWODWorker()
        let workoutInfo = try await worker.workoutInformation()
        self.workoutInfo = workoutInfo
    }
    
    func changeWODScale(index: Int, scale: NotifyWODModels.WODScale) {
        Task {
            guard self.workoutInfo.count > index else { return }
            self.workoutInfo[index].selectedScale = scale
        }
    }
}
