import UserNotifications

class NotificationManager {

    static let shared = NotificationManager()

    func requestPermission() {

        UNUserNotificationCenter.current()

            .requestAuthorization(options: [.alert, .sound]) { _, _ in }

    }

    func schedule(boss: Boss) {

        let content = UNMutableNotificationContent()

        content.title = "ボス復活通知"

        content.body = boss.notifyMessage

        let trigger = UNTimeIntervalNotificationTrigger(

            timeInterval: boss.notifyAfterSeconds,

            repeats: false

        )

        let request = UNNotificationRequest(

            identifier: UUID().uuidString,

            content: content,

            trigger: trigger

        )

        UNUserNotificationCenter.current().add(request)

    }

}
 
