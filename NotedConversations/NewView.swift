import SwiftUI

struct NewView: View {
    @Binding var showNewView: Bool
    var body: some View {
        VStack {
            ControlGroup{
                NavigationLink("Home", destination: HomeView(showNewView: $showNewView))
                NavigationLink("New", destination: NewView(showNewView: $showNewView))
            }
            
            Text("Study Group Notes")
                .font(.title)
                .padding(.top, 10)
                .foregroundColor(Color.blue.opacity(0.7))
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            VStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.blue.opacity(0.4))
                    .overlay(
                        Text("The body contains about 2.5 million sweat pores")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .frame(height: 120)
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            HStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.blue.opacity(0.4))
                    .overlay(
                        Text("The skin is the body's largest organ")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .frame(height: 120)
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            HStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.blue.opacity(0.4))
                    .overlay(
                        Text("The mitochondria is the powerhouse of the cell")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .frame(height: 120)
            
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            
            HStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.blue.opacity(0.4))
                    .overlay(
                        Text("Enter your text here...")
                            .font(.body)
                            .fixedSize()
                            .opacity(0.4)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .frame(height: 130)
        }
        .padding(.bottom)
    }
}
