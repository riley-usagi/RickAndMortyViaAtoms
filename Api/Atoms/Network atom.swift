import Atoms
import Foundation

struct NetworkAtom: ObservableObjectAtom, Hashable {
  func object(context: Context) -> NetworkUtility {
    .init()
  }
}
