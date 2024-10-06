import Atoms
import Foundation

struct CharactersPhaseAtom: ValueAtom, Hashable {
  func value(context: Context) -> AsyncPhase<[Character], any Error> {
    
    let name = context.watch(RequestAtom())
    
    return context.watch(FetchCharactersAtom(name: name).phase)
  }
}
