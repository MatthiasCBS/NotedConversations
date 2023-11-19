import SwiftUI

struct HomeView: View{
    @Binding var showNewView: Bool;
    @Binding var showExampleView: Bool;
    var body: some View{
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
            
            Text("Noted Conversations")
                .font(.title)
                .foregroundColor(Color.white)
            
            Button(action: {
                showNewView = true
            }) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color.purple.opacity(0.4))
                        .overlay(
                            Text("Study Group Notes")
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
            
            Button(action: {
                showNewView = true
            }) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color.purple.opacity(0.4))
                        .overlay(
                            Text("To Do List")
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
            
            Button(action: {
                showExampleView = true
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
            Spacer()
            Spacer()
        }
        .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
