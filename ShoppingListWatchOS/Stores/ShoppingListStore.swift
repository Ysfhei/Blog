import Foundation
import Combine

final class ShoppingListStore: ObservableObject {
    @Published private(set) var items: [ShoppingItem] = [] {
        didSet {
            persistItems()
        }
    }

    private let userDefaultsKey = "shopping_list_items_v1"
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        loadItems()
    }

    func addItem(named name: String) {
        var trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        if items.contains(where: { $0.name.caseInsensitiveCompare(trimmed) == .orderedSame }) {
            trimmed = uniqueName(from: trimmed)
        }
        items.insert(ShoppingItem(name: trimmed), at: 0)
    }

    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

    func toggleItem(_ item: ShoppingItem) {
        guard let index = items.firstIndex(of: item) else { return }
        items[index].isCompleted.toggle()
    }

    func clearCompleted() {
        items.removeAll { $0.isCompleted }
    }

    private func uniqueName(from base: String) -> String {
        var count = 2
        var candidate = "\(base) \(count)"
        let existingLower = Set(items.map { $0.name.lowercased() })
        while existingLower.contains(candidate.lowercased()) {
            count += 1
            candidate = "\(base) \(count)"
        }
        return candidate
    }

    private func persistItems() {
        do {
            let data = try JSONEncoder().encode(items)
            userDefaults.set(data, forKey: userDefaultsKey)
        } catch {
            // In a sample app we silently ignore persistence errors
        }
    }

    private func loadItems() {
        guard let data = userDefaults.data(forKey: userDefaultsKey) else {
            items = sampleItems()
            return
        }
        do {
            items = try JSONDecoder().decode([ShoppingItem].self, from: data)
        } catch {
            items = sampleItems()
        }
    }

    private func sampleItems() -> [ShoppingItem] {
        [
            ShoppingItem(name: "Milk"),
            ShoppingItem(name: "Eggs"),
            ShoppingItem(name: "Bread")
        ]
    }
}

