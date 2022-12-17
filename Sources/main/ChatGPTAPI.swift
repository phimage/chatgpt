//
//  ChatGPTAPI.swift
//
//  Created by emarchand on 17/12/2022.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct ChatGTPChoices: Decodable {
    var index: Int
    var text: String
    // var finish_reason: String
    // var logprobs?
}
struct ChatGTPResponse: Decodable {

    var id: String
    var model: String
    var object: String
    var created: Int
    // var usage: ChatGTPUsage
    var choices: [ChatGTPChoices]
}

class ChatGPTAPI {

    let url = URL(string: "https://api.openai.com/v1/completions")!
    let token: String

    init(token: String) {
        self.token = token
    }

    func prompt(_ text: String,
                maxTokens: Int = 4000,
                temperature: Float = 1.0,
                model: String = "text-davinci-003") async -> Result<ChatGTPResponse, Error> {

        let body: [String: Any] = [
            "model": model,
            "prompt": text,
            "max_tokens": maxTokens,
            "temperature": temperature
        ]

        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("Bearer "+self.token, forHTTPHeaderField: "Authorization")
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            urlRequest.httpMethod = "POST"

            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let parsedData = try JSONDecoder().decode(ChatGTPResponse.self, from: data)
            return .success(parsedData)
        } catch {
            return .failure(error)
        }
    }
}
