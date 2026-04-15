//
//  NetworkManager.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 06.01.2025.
//

import Alamofire

class TextNetworkManager {
    
    private let apiKey = Token.shared
    
    private let url = "https://bothub.chat/api/v2/openai/v1/chat/completions"
    
    func sendRequest(question: String, completion: @escaping ([Choice]) -> Void) {
        let header: HTTPHeaders = [
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader(name: "Authorization", value: "Bearer \(apiKey)")
        ]
        
        let parameter: [String: Any] = [
            "model": "gpt-4o",
            "messages": [
                ["role": "user", "content": question]
            ]
        ]
        
        AF.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseDecodable(of: APIResponse.self) { response in
            switch response.result {
            case .success(let APIResponse):
                completion(APIResponse.choices)
            case .failure(let error):
                print("Failed to generate text: \(error.localizedDescription)")
                completion([])
            }
        }
    }
}


