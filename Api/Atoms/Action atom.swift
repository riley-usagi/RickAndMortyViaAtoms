import Atoms
import Foundation

/// Actions of Application
struct ActionAtom: StateAtom, Hashable {
  
  /// Actions list
  enum ActionEnum {
    
    // Initial by default
    case initial
    
    // Request characters by name
    case requestByName(String)
  }
  
  func defaultValue(context: Context) -> ActionEnum {
    .initial
  }
}
