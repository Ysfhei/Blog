import SwiftUI

@main
struct ShoppingListApp: App {
    @StateObject private var store = ShoppingListStore()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(store)
        }
    }
}

