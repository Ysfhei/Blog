# Shopping List (watchOS example)

A minimal SwiftUI shopping-list app for Apple Watch with simple persistence via `UserDefaults`.

## Features
- Add items quickly
- Toggle items done/undone
- Delete by swipe
- Reorder with Edit mode
- Clear all completed
- Data persisted locally on the watch

## Requirements
- Xcode 15 or newer
- watchOS 10 or newer target (SwiftUI)

## Getting started
1. In Xcode, create a new project: watchOS > App (SwiftUI). Name it "ShoppingList".
2. Delete the auto-generated `ContentView.swift` and app file if you wish, or replace their contents.
3. Add the files from this folder into your WatchKit Extension target:
   - `ShoppingListApp.swift`
   - `Models/ShoppingItem.swift`
   - `Stores/ShoppingListStore.swift`
   - `Views/ContentView.swift`
4. Build and run on an Apple Watch simulator or device.

## Notes
- Persistence uses `UserDefaults` storing JSON-encoded `[ShoppingItem]`.
- This sample prefers clarity and small size over advanced architecture.
- You can extend it with iCloud sync via `NSUbiquitousKeyValueStore` or `CloudKit`.

## Screens
- Main screen shows an add field and a list.
- Tap a row to toggle completion.
- Swipe to delete, use Edit to reorder, and Clear Done to remove completed items.