import SwiftUI

struct ContentView: View {

    let bosses: [Boss] = [

        Boss(name: "サシ活", respawnSeconds: 180, notifyBeforeSeconds: 30),

        Boss(name: "通常ボス", respawnSeconds: 180, notifyBeforeSeconds: 30),

        Boss(name: "時空竜クロノゼリウス", respawnSeconds: 86400, notifyBeforeSeconds: 300),

        Boss(name: "残燃モエコ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "朽ちざる竜骸 イゾ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "黎明神 トモダチ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "古代魚 ザコーン", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "禁域のアヌビシュ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "禁域のクマヌイ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "禁域のヴァルネシア", respawnSeconds: 1800, notifyBeforeSeconds: 300)

    ]

    // 計測開始時刻

    @State private var startTimes: [UUID: Date] = [:]

    // 1秒更新用

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {

        NavigationView {

            List(bosses) { boss in

                Button {

                    startTimes[boss.id] = Date()

                    NotificationManager.shared.scheduleNotification(boss: boss)

                } label: {

                    VStack(alignment: .leading, spacing: 6) {

                        Text(boss.name)

                            .font(.headline)

                        if let start = startTimes[boss.id] {

                            Text("現在計測中")

                                .font(.caption)

                                .foregroundColor(.red)

                            Text(remainingTimeText(boss: boss, start: start))

                                .font(.subheadline)

                        } else {

                            Text("復活まで \(boss.respawnSeconds / 60)分")

                                .font(.subheadline)

                        }

                    }

                }

            }

            .navigationTitle("ボス通知タイマー")

        }

        .onAppear {

            NotificationManager.shared.requestPermission()

        }

        .onReceive(timer) { _ in } // 画面更新用

    }

    // 残り時間表示（②）

    func remainingTimeText(boss: Boss, start: Date) -> String {

        let elapsed = Int(Date().timeIntervalSince(start))

        let remaining = max(boss.respawnSeconds - elapsed, 0)

        let h = remaining / 3600

        let m = (remaining % 3600) / 60

        let s = remaining % 60

        if h > 0 {

            return String(format: "残り %02d:%02d:%02d", h, m, s)

        } else {

            return String(format: "残り %02d:%02d", m, s)

        }

    }

}
 
