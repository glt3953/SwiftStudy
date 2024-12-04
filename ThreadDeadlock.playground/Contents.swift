
import SwiftUI

struct ContentView: View {
    @State private var data: String = "Loading..." // `data` 用于存储从磁盘读取的数据，并在 UI 中显示。

    var body: some View {
        VStack {
            Text(data)
                .padding()
            Button("Load Data") {
                loadData()
            }
        }
    }

    func loadData() {
        // 通过 `Task` 创建一个并发上下文来运行异步代码块。在这个代码块中执行耗时的磁盘 IO 操作。
        Task {
            // 在后台执行磁盘 IO 操作
            let loadedData = await performDiskIO()
            // 在主线程更新 UI
            await MainActor.run {
                data = loadedData
            }
        }
    }

    // 模拟一个磁盘 IO 操作，可能是从文件中读取大数据
    func performDiskIO() async -> String {
        // 模拟磁盘操作耗时
        try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds delay

        // 这里可以进行实际的磁盘读取操作
        // 例如读取文件内容：
        // let fileURL = ...
        // let data = try? String(contentsOf: fileURL)

        return "Data Loaded Successfully!"
    }
}

//@main
struct DiskIOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
