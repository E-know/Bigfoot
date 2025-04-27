//
//  NotifyWODView.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/3/25.
//

import SwiftUI

struct NotifyWODView: View {
    @State var viewModel: NotifyWODViewModelProtocol = NotifyWODViewModel()
    var interactor: NotifyWODInteractor?
    
    init() {
        self.interactor = NotifyWODInteractor(presenter: .init(viewModel: viewModel))
    }
    
    var body: some View {
        VStack {
            NavigationTop
            
            if viewModel.workoutInfo.isEmpty {
                NotifyWODSkeletonView()
            } else {
                ScrollView {
                    VStack {
                        ForEach(viewModel.workoutInfo.indices, id: \.self) {
                            WorkoutView(workoutInfo: viewModel.workoutInfo[$0], index: $0)
                        }
                    }
                }
                .background(Color.scrollBackground)
            }
        }
        .task {
            try? await interactor?.fetchWorkoutInfo()
        }
    }
}
