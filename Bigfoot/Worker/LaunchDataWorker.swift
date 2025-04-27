//
//  LaunchDataWorker.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/27/25.
//

import Foundation

protocol LaunchDataWorkerProtocol {
    func fetchLaunchData() async throws -> LaunchDataEntity?
}

struct LaunchDataWorker: LaunchDataWorkerProtocol {
    func fetchLaunchData() async throws -> LaunchDataEntity? {
        guard let url = URL(string: "https://raw.githubusercontent.com/E-know/BigfootData/refs/heads/main/launchData.json") else { return nil }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return nil }
        let launchData = try JSONDecoder().decode(LaunchDataEntity.self, from: data)
        return launchData
    }
}
