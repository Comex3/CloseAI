//
//  ModelImage.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 08.01.2025.
//

import Foundation

struct ImageRequest: Codable {
    let model: String
    let prompt: String
    let n: Int
    let size: String
}

struct ImageResponse: Codable {
    let data: [GeneratedImage]
}

struct GeneratedImage: Codable {
    let url: String
}
