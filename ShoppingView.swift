import SwiftUI

struct ShopView: View {
    @State private var searchText = ""
    var body: some View {
            NavigationStack {
                DataView(sText: searchText)
                    .navigationTitle("Shop")
            }
            .searchable(text: $searchText)
    }
}
