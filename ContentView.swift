import SwiftUI

struct ContentView: View {
    let gradient = LinearGradient(colors: [.orange, .green],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    var body: some View {
        TabView {
            ShopView()
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Shop")
            }
            
            Text("Tab 2 view")
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("My List")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
