import SwiftUI

struct NewView: View {
    @Binding var showNewView: Bool
    @Binding var showExampleView: Bool
    @State private var userInputtedTitle: String = ""
    @State private var userInputtedText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
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
            
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    TextField("Enter title here...", text: $userInputtedTitle)
                        .padding(.leading, 10)
                        .frame(width: 340)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .background(Color.purple.opacity(0.3))
                }
                .padding(.leading, 30)
            }
            
            
            /*GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    TextEditor(text: $userInputtedTitle)
                        .padding(.leading, 10)
                        .font(.title3)
                        .opacity(0.4)
                        .frame(height: geometry.size.height * 0.1)
                    Text("Enter name here...")
                        .font(.title)
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        .foregroundColor(Color.white.opacity(0.7))
                        
                }
                .frame(width: UIScreen.main.bounds.width * 1.0)
            }*/
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            HStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.purple.opacity(0.4))
                    .overlay(
                         VStack(alignment: .leading) {
                            TextEditor(text: $userInputtedText)
                                .font(.title3)
                                .opacity(0.4)
                            Text("Enter your text here...")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .opacity(userInputtedText.isEmpty ? 0.8 : 0)
                                .padding(.bottom, 90)
                        }
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .frame(width: UIScreen.main.bounds.width * 1.0)
            .frame(height: 130)
        }
        .padding(.bottom)
        .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
