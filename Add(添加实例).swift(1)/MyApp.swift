import SwiftUI

@main
struct MyApp: App {
    @StateObject var fileViewModel: FileViewModel = FileViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fileViewModel)
        }
    }
}
