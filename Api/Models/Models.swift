import Foundation

struct CharacterResponse: Codable {
  let info: Info
  let results: [Character]
}

struct Info: Codable {
  let count: Int
  let pages: Int
  let next: String?
  let prev: String?
}

struct Character: Codable, Identifiable, Equatable {
  let id: Int
  let name: String
  let status: String
  let species: String
  let type: String
  let gender: String
  let origin: Origin
  let location: Location
  let image: String
  let episode: [String]
  let url: String
  let created: String
}

struct Origin: Codable, Equatable {
  let name: String
  let url: String
}

struct Location: Codable, Equatable {
  let name: String
  let url: String
}
