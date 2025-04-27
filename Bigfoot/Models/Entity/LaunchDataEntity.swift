//
//  LaunchDataEntity.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/27/25.
//

struct LaunchDataEntity: Decodable {
    let appVersion: String
    let forceUpdate: Bool
    let appstoreURL: String
}
