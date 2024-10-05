import Atoms
import SwiftUI

struct ContentView: View {
  
  @WatchState(ActionAtom()) var action: ActionAtom.ActionEnum
  
  @WatchStateObject(CharactersObjectAtom()) var charactersObject: CharactersObject
  
  @State private var searchText: String = ""
  
  var body: some View {
    NavigationView {
      
      VStack {
        
        // For example: Rick or Morty or Smith
        TextField("Search Character by name", text: $searchText)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
        
        List(charactersObject.characters) { character in
          VStack(alignment: .leading) {
            Text(character.name)
              .font(.headline)
            Text(character.species)
              .font(.subheadline)
          }
        }
        .listStyle(PlainListStyle())
        
      }
      .navigationTitle("Characters")
      
    }
    
    .onChange(of: searchText) { _, newValue in
      action = .requestByName(newValue)
    }
  }
}
