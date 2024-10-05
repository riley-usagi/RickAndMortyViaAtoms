import Atoms
import SwiftUI

struct ContentView: View {
  
  @WatchState(ActionAtom()) var action: ActionAtom.ActionEnum
  
  //  @Watch(CharactersAtom()) var charactersAtom: Task<[Character], Never>
  
  @WatchStateObject(CharactersObjectAtom()) var storage: CharactersObject
  
  @State private var searchText: String = ""
  
  var body: some View {
    NavigationView {
      
      VStack {
        
        // For example: Rick or Morty
        TextField("Search Character by name", text: $searchText)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
        
        List(storage.characters) { character in
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
//      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        action = .requestByName(newValue)
//      }
    }
  }
}
