import Atoms
import Foundation

/// Characters list
struct CharactersAtom: TaskAtom, Hashable {
  
  func value(context: Context) async -> [Character] {
    
    /// Initial value
    var characters: [Character] = []
    
    /// Current action
    let action  = context.watch(ActionAtom())
    
    /// Network methods
    let network = context.watch(NetworkAtom())
    
    switch action {
      
    case .initial:
      return characters
      
    case let .requestByName(name):
      return await Task {
        do {
          characters = try await network.fetchCharacters(name: name)
        } catch {
          print("Error fetching characters: \(error)")
        }
        
        return characters
      }.value
    }
  }
}
