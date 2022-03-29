import SwiftUI

struct Sample: View {
    @State private var joke: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                Task {
                    let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                    let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
                    joke = decodedResponse?.value ?? ""
                }
            } label: {
                Text("Fetch Joke")
            }
            Text(joke)
        }
    }
}

struct Joke: Codable {
    let value: String
}

struct Sample_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}
