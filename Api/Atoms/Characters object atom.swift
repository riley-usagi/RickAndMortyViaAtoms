import Atoms
import Foundation

class CharactersObject: ObservableObject {
  @Published var characters: [Character] = []
  
  func request(name: String) {
    Task {
      do {
        characters = try await fetchCharacters(name: name)
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func fetchCharacters(name: String) async throws -> [Character] {
    let urlString = "https://rickandmortyapi.com/api/character/?name=\(name)&status=alive"
    
    guard let url = URL(string: urlString) else {
      throw NSError(domain: "Invalid URL", code: 1, userInfo: nil)
    }
    
    let data      = try await URLSession.shared.data(from: url).0
    let response  = try JSONDecoder().decode(CharacterResponse.self, from: data)
    
    return response.results ?? []
  }
}

struct CharactersObjectAtom: ObservableObjectAtom, Hashable {
  func object(context: Context) -> CharactersObject {
    let storage = CharactersObject()
    let action  = context.watch(ActionAtom())
    
    switch action {
      
    case .initial:
      break
      
    case let .requestByName(name):
      storage.request(name: name)
    }
    
    return storage
  }
}
