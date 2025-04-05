//
//  NotifyWODView.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/3/25.
//

import SwiftUI

struct NotifyWODView: View {
	@State var viewModel = NotifyWODDomainModel()
	var interactor: NotifyWODInteractor!
	
	init() {
		self.interactor = NotifyWODInteractor(viewModel: viewModel)
	}
	
    var body: some View {
		VStack {
			NavigationTop
			
			ScrollView {
				VStack {
					WorkoutView()
						.padding(16)
					
					PreviousWorkoutView()
						.padding(16)
				}
			}
			.background(Color.scrollBackground)
		}
    }
}

extension NotifyWODView {
	@ViewBuilder
	var NavigationTop: some View {
		HStack {
			Text("와드 알리미")
				.font(.system(size: 25, weight: .black))
		}
		.frame(maxWidth: .infinity)
		.frame(height: 50)
		.background(.white)
		.clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
	}
}

extension NotifyWODView {
	@ViewBuilder
	func WorkoutView() -> some View {
		VStack(alignment: .leading) {
			Text("오늘의 운동")
				.font(.system(size: 18, weight: .bold))
				.padding(.bottom, 8)
			
			Text("2025년 4월 3일 목요일")
				.font(.system(size: 14))
				.foregroundStyle(Color.gray)
				.padding(.bottom, 12)
			
			Group {
				StrengthCell()
					.padding(.bottom, 20)
				
				WODCell()
			}
			.padding(.leading, 4)
		}
		.padding(.horizontal, 16)
		.padding(.vertical, 12)
		.background(.white)
		.clipShape(RoundedRectangle(cornerRadius: 8))
	}
	
	@ViewBuilder
	func StrengthCell() -> some View {
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
					Text("5 SET")
					
					Text("Clean Complex")
					
					Text("- 1 Clean")
					
					Text("- 1 Front Squat")
					
					Text("- 1 Jerk")
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
	func WODCell() -> some View {
		VStack(alignment: .leading) {
	
			
			HStack(alignment: .bottom) {
				VStack(alignment: .leading, spacing: 8) {
					Text("W.O.D")
						.font(.system(size: 14, weight: .bold))
					
					Text("\"Helen\"")
						.font(.system(size: 20, weight: .bold))
						.padding(.trailing, 8)
				}
				
				ForEach(NotifyWODModels.WODScale.allCases, id: \.rawValue) { scale in
					scale.button(currentScale: viewModel.scale) {
						interactor.changeWODScale(scale: scale)
					}
				}
				
				Spacer()
				
				Text("25분")
					.font(.system(size: 14))
			}
			
			HStack(alignment: .top, spacing: 20) {
				Image(systemName: "figure.strengthtraining.traditional")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 28)
					
				VStack(alignment: .leading, spacing: 4) {
					Text("On the Minutes X 10")
					
					Text("3 Power Cleans")
					
					Text("3 Front Squats")
					
					Text("3 Push Jerks")
						 
					Text("Max Lateral Burpees over Barbell")
					
					Text("")
					
					Text("Bar bell: 135 / 95 lb")
					
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
	
	@ViewBuilder
	func PreviousWorkoutView() -> some View {
		VStack {
			HStack {
				Text("이전 WOD")
					.font(.system(size: 14, weight: .bold))
				
				Spacer()
				
				Text("2024년 3월 13일")
					.font(.system(size: 14))
			}
			.foregroundStyle(.previousWODTitle)
			.padding(.bottom, 24)
			
			StrengthCell()
			
			WODCell()
		}
		.padding(.horizontal, 16)
		.padding(.vertical, 12)
		.background(.white)
		.clipShape(RoundedRectangle(cornerRadius: 8))
	}
}

extension NotifyWODModels.WODScale {
	@ViewBuilder
	func button(currentScale: Self?, action: @escaping () -> Void) -> some View {
		Button(action: action) {
			Text(self.rawValue)
				.font(.system(size: 12, weight: self == currentScale ? .bold : .regular))
				.foregroundStyle(self.fontColor)
		}
		.frame(width: 54, height: self == currentScale ? 48 : 24)
		.background(self.backgroundColor)
		.clipShape(RoundedRectangle(cornerRadius: 8))
	}
}

#Preview {
	NotifyWODView()
}
