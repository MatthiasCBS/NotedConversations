import SwiftUI

struct ExampleView: View {
    @Binding var showNewView: Bool;
    @Binding var showExampleView: Bool;
    @State private var userInput: String = ""
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
            
            Text("Study Group Notes")
                .font(.title)
                .padding(.top, 10)
                .foregroundColor(Color.white.opacity(0.7))
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            VStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.purple.opacity(0.4))
                    .overlay(
                        Text("The body contains about 2.5 million sweat pores")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .foregroundStyle(.white)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: UIScreen.main.bounds.width * 1.0)
            .frame(height: 120)
            
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
                        Text("The skin is the body's largest organ")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .foregroundStyle(.white)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: UIScreen.main.bounds.width * 1.0)
            .frame(height: 120)
            
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
                        Text("The mitochondria is the powerhouse of the cell")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .foregroundStyle(.white)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: UIScreen.main.bounds.width * 1.0)
            .frame(height: 120)
            
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
                        ZStack(alignment: .leading) {
                            TextEditor(text: $userInput)
                                .font(.title3)
                                .opacity(0.4)
                            Text("Enter your text here...")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .opacity(userInput.isEmpty ? 0.8 : 0)
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
