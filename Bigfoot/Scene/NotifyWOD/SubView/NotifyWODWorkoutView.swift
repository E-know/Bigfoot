//
//  NotifyWODWorkoutView.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/27/25.
//

import SwiftUI

extension NotifyWODView {
    @ViewBuilder
    func WorkoutView(workoutInfo: WorkoutViewModel, index: Int) -> some View {
        VStack(alignment: .leading) {
            if index == 0 {
                Text("오늘의 운동")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 8)
            }
            
            Text(workoutInfo.dateString)
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
                .padding(.bottom, 12)
            
            Group {
                if let strength = workoutInfo.strength {
                    StrengthCell(strength: strength)
                        .padding(.bottom, 20)
                }
                
                WODCell(wodViewModel: workoutInfo.wod, index: index)
            }
            .padding(.leading, 4)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder
    func StrengthCell(strength: StrengthViewModel) -> some View {
        VStack(alignment: .leading) {
            Text("Strength")
                .font(.system(size: 14, weight: .bold))
                .padding(.bottom, 8)
            
            HStack(alignment: .top, spacing: 20) {
                Image(systemName: "dumbbell.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28)
                
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(strength.description, id: \.self) {
                        Text($0)
                    }
                }
                .font(.system(size: 14))
                .foregroundStyle(.cellFont)
                
                Spacer()
            }
            .padding(16)
            .background(.cellBackground)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    @ViewBuilder
    func WODCell(wodViewModel: WODViewModel, index: Int) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // --- New: Difficulty selection segmented control at the top ---
            // --- End segmented control ---
            
            // WOD Title Section
            VStack(alignment: .leading, spacing: 8) {
                Text("W.O.D")
                    .font(.system(size: 14, weight: .bold))
                Text("\(wodViewModel.title)")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.trailing, 8)
            }
            .padding(.bottom, 4)
            
            // Timecap
            Text("\(wodViewModel.timecap)분")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.bottom, 4)
            
            HStack(spacing: 0) {
                ForEach(NotifyWODModels.WODScale.allCases, id: \.self) { scale in
                    Button(action: {
                        interactor?.changeWODScale(index: index, scale: scale)
                    }) {
                        Text(scale.rawValue)
                            .font(.system(size: 16, weight: viewModel.workoutInfo[index].selectedScale == scale ? .black : .regular))
                            .frame(maxWidth: .infinity, minHeight: 36)
                            .background(scale.backgroundColor)
                            .foregroundColor(scale.fontColor)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                    .buttonStyle(PlainButtonStyle())
                    if scale != NotifyWODModels.WODScale.allCases.last {
                        Divider()
                            .frame(width: 1, height: 28)
                            .background(Color.gray.opacity(0.3))
                    }
                }
            }
            .padding(.vertical, 4)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            // WOD Description Section
            HStack(alignment: .top, spacing: 20) {
                Image(systemName: "figure.strengthtraining.traditional")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28)
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(wodViewModel.description.indices, id: \.self) {
                        Text(wodViewModel.description[$0])
                    }
                }
                .font(.system(size: 14))
                .foregroundStyle(Color.cellFont)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.cellBackground)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
