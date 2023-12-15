import SwiftUI

struct HomeView: View {
    @Binding var showHomeView: Bool
    @Binding var showNewView: Bool
    @Binding var showExampleView: Bool
    @ObservedObject var noteManager: NoteManager
    @State private var isPresentingDetail: Bool = false
    @State private var selectedNote: Note? = nil
    @State private var selectedNoteTrigger: Bool = false

    var body: some View {
        VStack {
            HStack {
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
                .padding(.horizontal, 15)
            }
            .padding()
            
            Text("Noted Conversations")
                .font(.title)
                .foregroundColor(Color.purple.opacity(0.9))
                .padding()
            
            ConversationList(noteManager: noteManager, isPresentingDetail: $isPresentingDetail, selectedNote: $selectedNote)
            ExampleButton(showHomeView: $showHomeView, showNewView: $showNewView, showExampleView: $showExampleView)
            Spacer()
            Spacer()
        }
        .background(Color.gray.edgesIgnoringSafeArea(.all))
        
        .fullScreenCover(isPresented: $isPresentingDetail) {
            if let selectedNote = selectedNote,
               let selectedIndex = noteManager.notes.firstIndex(of: selectedNote) {
                DetailView(
                    noteManager: noteManager,
                    onHomeAction: {
                        showHomeView = true
                        showNewView = false
                        showExampleView = false
                    },
                    onNewAction: {
                        showNewView = true
                        showHomeView = false
                        showExampleView = false
                    },
                    isPresentingDetail: $isPresentingDetail,
                    noteIndex: selectedIndex
                )
                .onChange(of: selectedNoteTrigger) { _ in
                    print("Selected Note changed to: \(String(describing: selectedNote))")
                }
            } else {
                let selectedIndex = 0
                DetailView(
                    noteManager: noteManager,
                    onHomeAction: {
                        isPresentingDetail = false
                        showHomeView = true
                        showNewView = false
                        showExampleView = false
                    },
                    onNewAction: {
                        showNewView = true
                        showHomeView = false
                        showExampleView = false
                    },
                    isPresentingDetail: $isPresentingDetail,
                    noteIndex: selectedIndex
                )
                .onChange(of: selectedNoteTrigger) { _ in
                    // This closure will be called when selectedNote changes
                    print("Selected Note changed to: \(String(describing: selectedNote))")
                    isPresentingDetail = true
                }
            }
        }



        .onAppear {
            if let firstNote = noteManager.notes.first {
                selectedNote = firstNote
                selectedNoteTrigger.toggle()
            }
        }
    }
}



struct ConversationList: View {
    @ObservedObject var noteManager: NoteManager
    @Binding var isPresentingDetail: Bool
    @Binding var selectedNote: Note?
    @State private var selectedNoteTrigger: Bool = false

    var body: some View {
        ForEach(noteManager.notes) { note in
            Button(action: {
                selectedNote = note
                isPresentingDetail = true
                selectedNoteTrigger.toggle()
                print("Tapped Note: \(note)")
            }) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color.purple.opacity(0.4))
                        .overlay(
                            Text(note.title)
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .fixedSize()
                                .foregroundStyle(.white)
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .frame(width: UIScreen.main.bounds.width * 1.0)
            }
        }
    }
}

struct ExampleButton: View {
    @Binding var showHomeView: Bool
    @Binding var showNewView: Bool
    @Binding var showExampleView: Bool

    var body: some View {
        Button(action: {
            showExampleView = true
            showHomeView = false
            showNewView = false
        }) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.purple.opacity(0.4))
                    .overlay(
                        Text("Example Note")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .foregroundStyle(.white)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .frame(width: UIScreen.main.bounds.width * 1.0)
        }
    }
}
