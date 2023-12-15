import SwiftUI

struct DetailView: View {
    @ObservedObject var noteManager: NoteManager
    var onHomeAction: () -> Void
    var onNewAction: () -> Void
    @Binding var isPresentingDetail: Bool
    let noteIndex: Int

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    onHomeAction()
                }) {
                    Text("Home")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(.white)
                }

                Button(action: {
                    onNewAction()
                }) {
                    Text("New")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 15)
            }
            .padding()
            
            if let note = noteManager.openNote(index: noteIndex) {
                Text("Note Title: \(note.title)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .fixedSize()
                    .foregroundColor(.white)
                    .padding()
                
                Text(note.text)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
            } else {
                Text("Note not found!")
                    .foregroundStyle(.white)
                    .padding()
            }
        }
        .background(Color.gray.edgesIgnoringSafeArea(.all))
        .onAppear {
            if let note = noteManager.openNote(index: noteIndex) {
                print("Note Title: \(note.title)")
                print("Note Text: \(note.text)")
            }
        }
    }
}
