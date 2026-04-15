//
//  ImageNetworkManager.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 08.01.2025.
//

import Alamofire

class ImageNetworkManager {
    
    private let url = "https://bothub.chat/api/v2/openai/v1/images/generations"
    
    private let apiKey = Token.shared
    
    func sendRequest(prompt: String, n: Int, size: String, completion: @escaping ([GeneratedImage]) -> Void) {
        
        let header: HTTPHeaders = [
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader(name: "Authorization", value: "Bearer \(apiKey)")
        ]
        
        let parameter: Parameters = [
            "model" : "dall-e-3",
            "prompt" : prompt,
            "n" : n,
            "size" : size
        ]
        
        
        AF.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseDecodable(of: ImageResponse.self) { response in
            switch response.result {
            case .success(let imageResponse):
                completion(imageResponse.data)
            case .failure(let error):
                print("Failed to generate image: \(error.localizedDescription)")
                completion([])
            }
        }
    }
}
    









