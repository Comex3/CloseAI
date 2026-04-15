//
//  Model.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 05.01.2025.
//

import Foundation

struct APIResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: Message
}

struct Message: Codable {
    let role: String 
    let content: String
}

struct Body: Encodable {
    let model: String
    let messages: [Message]
}



