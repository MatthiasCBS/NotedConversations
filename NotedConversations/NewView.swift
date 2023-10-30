import SwiftUI

struct NewView: View {
    var body: some View {
        VStack {
            ControlGroup{
                NavigationLink("Home", destination: HomeView())
                NavigationLink("New", destination: NewView())
            }
            
            Text("Study Group Notes")
                .font(.title)
                .padding(.top, 10)
                .foregroundColor(Color.blue.opacity(0.7))
            Group {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            HStack(alignment: .center) {
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
            .frame(width: UIScreen.main.bounds.width * 0.25)
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
            .frame(width: UIScreen.main.bounds.width * 0.25)
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
            .frame(width: UIScreen.main.bounds.width * 0.24)
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
            .frame(width: UIScreen.main.bounds.width * 0.3)
            .frame(height: 170)
        }
        .padding(.bottom)
    }
}
