import SwiftUI

struct HomeView: View{
    @Binding var showNewView: Bool;
    var body: some View{
        VStack {
            ControlGroup{
                NavigationLink("Home", destination: HomeView(showNewView: $showNewView))
                NavigationLink("New", destination: NewView(showNewView: $showNewView))
            }
            .padding()
            
            Text("Noted Conversations")
                .font(.title)
                .foregroundColor(Color.purple)
            
            Button(action: {
                showNewView = true
            }) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color.blue.opacity(0.4))
                        .overlay(
                            Text("Study Group Notes")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .fixedSize()
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .frame(width: UIScreen.main.bounds.width * 0.8)
            }
            
            Button(action: {
                showNewView = true
            }) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color.pink.opacity(0.4))
                        .overlay(
                            Text("To Do List")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .fixedSize()
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .frame(width: UIScreen.main.bounds.width * 0.8)
            }
            
            Button(action: {
                showNewView = true
            }) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color.orange.opacity(0.4))
                        .overlay(
                            Text("Example Note")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .fixedSize()
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .frame(width: UIScreen.main.bounds.width * 0.8)
                
            }
            Spacer()
        }
    }
}
