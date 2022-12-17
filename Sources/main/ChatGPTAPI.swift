//
//  ChatGPTAPI.swift
//  
//  Created by emarchand on 17/12/2022.
//

import Foundation

class ChatGPTAPI {

    let url = URL(string: "https://api.openai.com/v1/completions")!
    let token: String

    init(token: String) {
        self.token = token
    }

    func prompt(_ text: String,
                maxTokens: Int = 4000,
                temperature: Float = 1.0,
                model: String = "text-davinci-003") async -> Any {
        
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer "+self.token
        ]
        
        let body: [String : Any] = [
            "model": model,
            "prompt": text,
            "max_tokens": maxTokens,
            "temperature": temperature
        ]

        //TODO make request
        
        return NSNull.self
    }
}
