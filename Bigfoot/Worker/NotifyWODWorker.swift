//
//  NotifyWODWorker.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/5/25.
//

import Foundation

protocol NotifyWODRepositoryProtocol {
	func workoutInformation() async throws -> [WorkoutEntity]
}

struct NotifyWODWorker {
	private let repository: NotifyWODRepositoryProtocol
	
	init(repository: NotifyWODRepositoryProtocol = NotifyWODRepository()) {
		self.repository = repository
	}
	
	func workoutInformation() async throws -> [WorkoutModel] {
		let entity = try await repository.workoutInformation()
		return entity.compactMap { $0.toDomain() }
	}
}

struct NotifyWODRepository: NotifyWODRepositoryProtocol {
	private let service: NetworkService
	
	init(service: NetworkService = NetworkService()) {
		self.service = service
	}
	
	func workoutInformation() async throws -> [WorkoutEntity] {
		let urlString = "https://raw.githubusercontent.com/E-know/Bigfoot/refs/heads/main/data/workout.json"
		return try await service.request(urlString: urlString)
	}
}

struct NetworkService {
	func request<T: Decodable>(urlString: String) async throws -> T {
		guard let url = URL(string: urlString) else { throw NetworkError.wrongURL }
		let request = URLRequest(url: url)
		
		let (data, response) = try await URLSession.shared.data(for: request)
		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.networkFail }
		
		do {
			let entity = try JSONDecoder().decode(T.self, from: data)
			return entity
		} catch {
			throw NetworkError.decodingFail
		}
	}
}

enum NetworkError: Error {
	case wrongURL
	case networkFail
	case decodingFail
}
