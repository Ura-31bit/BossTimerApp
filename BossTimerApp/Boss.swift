import Foundation
struct Boss: Identifiable {
   let id = UUID()
   let name: String
   let respawnSeconds: Int
   let notifyBeforeSeconds: Int
}
