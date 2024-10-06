import Atoms
import Foundation

struct RequestAtom: StateAtom, Hashable {
  func defaultValue(context: Context) -> String { "" }
}
