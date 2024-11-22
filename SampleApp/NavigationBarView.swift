import SwiftUI

enum Tab: Int {
    case home = 0
    case logs = 1
}

struct NavigationBar: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var selectedTab:Tab
    
    var body: some View {
        HStack(spacing: 10) {
            //Home
            Button {
                selectedTab = .home
            } label: {
                ZStack{
                    NavigationBarButtonView(image: "home", text: "Home", isActive: selectedTab == .home)
                }
            }
            
            Button {
                selectedTab = .logs
            } label: {
                NavigationBarButtonView(image: "list", text: "Logs", isActive: selectedTab == .logs)
            }
        }
        
        .frame(height: 36)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(selectedTab: .constant(.home))
    }
}

struct NavigationBarButtonView: View {
    
    var image:String
    var text:String
    var isActive:Bool
    
    var body: some View {
        HStack(spacing: 10){
                GeometryReader{
                    geo in
                    VStack(spacing: 3) {
                        Rectangle()
                            .frame(height: 0)
                        Image(image)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .foregroundColor(isActive ? .blue : .gray)
                        Text(text)
                            .font(.title3)
                            .foregroundColor(isActive ? .blue : .gray)
                    }
                    .accessibilityAddTraits(.isButton)
                    .accessibilityIdentifier("\(text) button")
                    
                }
            
        }
    }
}
