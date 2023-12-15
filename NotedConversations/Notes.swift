import Foundation

struct Note: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var text: String
}

class NoteManager: ObservableObject {
    @Published var notes: [Note] = [] {
        didSet {
            // Notify observers when notes change
            objectWillChange.send()
        }
    }
    
    func addNote(title: String, text: String) {
        let newNote = Note(title: title, text: text)
        notes.append(newNote)
        
        print("Added Note: \(newNote)")
    }
    
    func openNote(index: Int) -> Note? {
        guard index >= 0, index < notes.count else {
            return nil
        }
        return notes[index]
    }
}
