import Atoms
import SwiftUI

struct ContentView: View {
  
  @Watch(CharactersPhaseAtom()) var charactersPhase
  
  @WatchState(RequestAtom()) var request
  
  @State private var searchText: String = ""
  
  var body: some View {
    NavigationView {
      
      VStack {
        
        // For example: Rick or Morty
        TextField("Search Character by name", text: $request)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
        
        Group {
          if case let .success(receivedCharacters) = charactersPhase {
            List(receivedCharacters) { character in
              VStack(alignment: .leading) {
                Text(character.name)
                  .font(.headline)
                Text(character.species)
                  .font(.subheadline)
              }
            }
            .listStyle(PlainListStyle())
          }
        }
      }
      .navigationTitle("Characters")
      
    }
  }
}
