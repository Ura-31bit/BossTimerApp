import Foundation
struct Boss: Identifiable {
   let id = UUID()
   let name: String
   let respawnSeconds: TimeInterval
   let notifyBeforeSeconds: TimeInterval
   var notifyAfterSeconds: TimeInterval {
       respawnSeconds - notifyBeforeSeconds
   }
   var notifyMessage: String {
       "\(name)のリポップ\(Int(notifyBeforeSeconds))秒前です。"
   }
}
