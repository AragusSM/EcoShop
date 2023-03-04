import SwiftUI

struct ImageView: View {
    let imageUrl: String
    
    var body: some View {
        if let url = URL(string: imageUrl), let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            Text("Unable to load image")
        }
    }
}


struct ContentView_PAreviews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrl: "https://freetailhackers.com/hack-the-future/public/title-planets.svg")
            .preferredColorScheme(.light)
    }
}
