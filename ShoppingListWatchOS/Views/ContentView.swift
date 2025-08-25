import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: ShoppingListStore
    @State private var newItemName: String = ""

    var body: some View {
        VStack(spacing: 8) {
            addRow
            list
        }
        .padding(.horizontal, 8)
        .navigationTitle("Shop List")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(role: .destructive, action: store.clearCompleted) {
                    Label("Clear Done", systemImage: "trash")
                }.disabled(!store.items.contains { $0.isCompleted })
            }
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
        }
    }

    private var addRow: some View {
        HStack(spacing: 6) {
            TextField("Add item", text: $newItemName, onCommit: addItem)
                .textInputAutocapitalization(.words)
                .submitLabel(.done)
            Button(action: addItem) {
                Image(systemName: "plus.circle.fill")
            }
            .disabled(newItemName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
    }

    private var list: some View {
        List {
            ForEach(store.items) { item in
                Button(action: { store.toggleItem(item) }) {
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isCompleted ? .green : .secondary)
                        Text(item.name)
                            .strikethrough(item.isCompleted)
                            .foregroundColor(item.isCompleted ? .secondary : .primary)
                    }
                }
                .buttonStyle(.plain)
            }
            .onDelete(perform: store.removeItems)
            .onMove(perform: store.moveItems)
        }
        .listStyle(.carousel)
    }

    private func addItem() {
        let trimmed = newItemName.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        store.addItem(named: trimmed)
        newItemName = ""
    }
}

#Preview {
    ContentView()
        .environmentObject(ShoppingListStore())
}

