import Foundation

struct ShoppingItem: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var isCompleted: Bool

    init(id: UUID = UUID(), name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        self.isCompleted = isCompleted
    }

    var isValid: Bool {
        !name.isEmpty
    }
}

