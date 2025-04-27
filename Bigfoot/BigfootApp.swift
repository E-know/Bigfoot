//
//  BigfootApp.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/3/25.
//

import SwiftUI
import UIKit

@main
struct BigfootApp: App {
    var body: some Scene {
        WindowGroup {
            ForceUpdateWrapperView()
        }
    }
}


struct ForceUpdateWrapperView: View {
    @State private var showForceUpdateAlert = false
    @State private var appstoreURL: String? = nil
    @State private var isLoaded = false
    
    var body: some View {
        if isLoaded {
            NotifyWODView()
        } else {
            ZStack {
                Color.white
                
                Image("appIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(32)
            }
            .task {
                let worker = LaunchDataWorker()
                guard let launchData = try? await worker.fetchLaunchData() else { return }
                if launchData.forceUpdate {
                    appstoreURL = launchData.appstoreURL
                    showForceUpdateAlert = true
                } else {
                    try? await Task.sleep(nanoseconds: 1_500_000_000)
                    isLoaded = true
                }
            }
            .alert("업데이트가 필요합니다", isPresented: $showForceUpdateAlert) {
                Button("확인") {
                    if let urlString = appstoreURL, let url = URL(string: urlString) {
                        UIApplication.shared.open(url)
                    }
                }
            } message: {
                Text("앱의 필수 업데이트가 필요합니다. 앱스토어로 이동합니다.")
            }
        }
    }
}
