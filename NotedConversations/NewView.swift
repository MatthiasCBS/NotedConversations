import SwiftUI

struct NewView: View {
    @Binding var showHomeView: Bool
    @ObservedObject var noteManager: NoteManager
    @Binding var showNewView: Bool
    @Binding var showExampleView: Bool
    @State private var userInputtedTitle: String = ""
    @State private var userInputtedText: String = ""
    @State private var storedNotes: [StoredNote] = []
    @State private var isActive: Bool = true {
        didSet {
            if !isActive {
                storedNotes = []
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showHomeView = true
                    showNewView = false
                    showExampleView = false
                }) {
                    Text("Home")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.white)
                }
                
                Button(action: {
                    showNewView = true
                    showHomeView = false
                    showExampleView = false
                }) {
                    Text("New")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.white)
                }
                
                Button(action: {
                    noteManager.addNote(title: userInputtedTitle, text: userInputtedText)
                    showHomeView = true
                    showNewView = false
                    showExampleView = false
                    userInputtedTitle = ""
                    userInputtedText = ""
                    
                    print("All Notes: \(noteManager.notes)")
                }) {
                    Text("Save")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.white)
                }
                .padding(.horizontal, 15)
            }
            .padding()
            
            TextField("Enter Title Here...", text: $userInputtedTitle)
                .padding(.leading, 10)
                .frame(width: 340)
                .multilineTextAlignment(.center)
                .font(.title)
                .background(Color.purple.opacity(0.3))
                .foregroundColor(.white)

            VStack(alignment: .center) {
                ScrollView {
                    ForEach(storedNotes, id: \.self) { storedNote in
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                            .background(Color.purple.opacity(0.4))
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text(storedNote.text)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 70)
                            .padding(.bottom)
                    }
                }
            }
            .frame(maxHeight: 1000)

            TextEditor(text: $userInputtedText)
                .font(.title3)
                .foregroundColor(.black)
                .background(Color.purple.opacity(1.0))
                .frame(maxWidth: .infinity, maxHeight: 220)
                .padding(.bottom, 90)
                .opacity(0.8)

                Button(action: {
                    guard !userInputtedTitle.isEmpty else { return }

                    let newStoredNote = StoredNote(title: userInputtedTitle, text: userInputtedText)
                    storedNotes.append(newStoredNote)
                }) {
                    Text("Enter")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                }
                .background(Color.purple.opacity(0.4))
            }
            .background(Color.gray.edgesIgnoringSafeArea(.all))
            .onAppear {
                storedNotes = noteManager.notes.map { StoredNote(title: $0.title, text: $0.text) }
            }
            .onDisappear {
                isActive = false
                storedNotes = []
            }
            .onReceive(noteManager.$notes) { updatedNotes in
                if isActive {
                    storedNotes = updatedNotes.map {
                        StoredNote(title: $0.title, text: $0.text)
                }
            }
        }
    }
}

struct StoredNote: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let text: String
}
