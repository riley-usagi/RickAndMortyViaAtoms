import Foundation

@MainActor class NetworkUtility: ObservableObject {
  
  func fetchCharacters(name: String) async throws -> [Character] {
    let urlString = "https://rickandmortyapi.com/api/character/?name=\(name)&status=alive"
    
    guard let url = URL(string: urlString) else {
      throw NSError(domain: "Invalid URL", code: 1, userInfo: nil)
    }
    
    let data      = try await URLSession.shared.data(from: url).0
    let response  = try JSONDecoder().decode(CharacterResponse.self, from: data)
    
    return response.results
  }
  
}
