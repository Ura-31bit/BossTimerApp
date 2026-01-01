import SwiftUI

struct ContentView: View {

    let bosses: [Boss] = [

        Boss(name: "サシ活", respawnSeconds: 180, notifyBeforeSeconds: 30),

        Boss(name: "通常ボス", respawnSeconds: 180, notifyBeforeSeconds: 30),

        Boss(name: "残燃モエコ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "朽ちざる竜骸 イゾ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "黎明神 トモダチ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "古代魚 ザコーン", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "禁域のアヌビシュ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "禁域のクマヌイ", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "禁域のヴァルネシア", respawnSeconds: 1800, notifyBeforeSeconds: 300),

        Boss(name: "時空竜クロノゼリウス", respawnSeconds: 86400, notifyBeforeSeconds: 300)

    ]

    var body: some View {

        NavigationView {

            List(bosses) { boss in

                Button {

                    NotificationManager.shared.schedule(boss: boss)

                } label: {

                    VStack(alignment: .leading) {

                        Text(boss.name)

                            .font(.headline)

                        Text("復活 \(Int(boss.respawnSeconds / 60))分 / \(Int(boss.notifyBeforeSeconds))秒前通知")

                            .font(.caption)

                            .foregroundColor(.gray)

                    }

                }

            }

            .navigationTitle("ボス復活タイマー")

        }

        .onAppear {

            NotificationManager.shared.requestPermission()

        }

    }

}
 
