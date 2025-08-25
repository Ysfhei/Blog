# Drop-in setup for Xcode (watchOS)

Follow these steps to add the Shopping List watch app to a new Xcode project.

## 1) Create the project
1. Open Xcode > File > New > Project…
2. Select watchOS > App. Next.
3. Product Name: ShoppingList (or your choice)
4. Interface: SwiftUI. Language: Swift.
5. Create the project.

## 2) Add the files
1. In Finder, open this `XcodeDropIn/WatchApp` folder.
2. Drag these folders into your WatchKit Extension target’s group in Xcode (Enable “Copy items if needed”):
   - `WatchApp/Models`
   - `WatchApp/Stores`
   - `WatchApp/Views`
3. Drag `WatchApp/ShoppingListApp.swift` into the WatchKit Extension target as well.

Tip: Make sure all added files are checked for the Watch target in the File Inspector (right panel) under “Target Membership”.

## 3) Remove template files
- Optionally delete the auto-generated `ContentView.swift` and the default `YourAppNameApp.swift` from the Watch target, or replace their contents with the provided ones.

## 4) Build & run
- Choose an Apple Watch simulator and press Run. The app persists items with `UserDefaults`.

## Structure
- `Models/ShoppingItem.swift`: item model
- `Stores/ShoppingListStore.swift`: observable data store with persistence
- `Views/ContentView.swift`: main UI
- `ShoppingListApp.swift`: app entry point