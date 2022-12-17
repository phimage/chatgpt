
import ArgumentParser
import Foundation

@main
struct ChatGPT: AsyncParsableCommand {

    @Option(name: [.long] , help: "API Key from https://beta.openai.com/account/api-keys")
    var token: String

    @Flag(name: [.long, .short],help: "interactive prompt")
    var interactive: Bool = false

    @Option(name: [.long] , help: "The model used, default: text-davinci-003")
    var model: String = "text-davinci-003"

    @Option(name: .long , help: "The maximum number of tokens to generate in the completion. Default 4000")
    var maxTokens: Int = 4000

    @Option(name: [.long, .short] , help: "What sampling temperature to use. Higher values means the model will take more risks. Try 0.9 for more creative applications, and 0 (argmax sampling) for ones with a well-defined answer. Default 1.0")
    var temperature: Float = 1

    @Argument(help: "prompt text")
    var prompt: String?

    func run() async throws {
        let chat = ChatGPTAPI(token: token)
        if interactive {
            var goOn = true
            while(goOn) {
                let input = "stop" // TODO Read system input
                if input == "stop" || input == "quit" || input == "exit" {
                    goOn = false
                } else {
                    // TODO prompt
                }
            }
        } else if let prompt = prompt {
            let result = await chat.prompt(prompt)
            // TODO display result
        } else {
            // Read system input one time
            // TODO prompt
        }
    }

}
