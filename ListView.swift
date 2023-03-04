import SwiftUI


struct ItemView: View, Identifiable {
    let id = UUID()
    var Price: Float = 10.00
    var Item: String = "Item Name"
    var PictureURL: String = ""
    var body: some View {
        
        let realURL: String = "https://images.heb.com/is/image/HEBGrocery/prd-small/" + PictureURL + ".jpg"
        
        ZStack{
            RoundedRectangle(cornerRadius: 10).fill(Color(red: 0.93, green: 0.93, blue: 0.93))
            HStack(alignment: .top){
                VStack(alignment:.leading){
                    Text(Item).font(.system(size: 25)).padding(5)
                    Text("$"+String(format: "%.2f", Price) ).font(.system(size: 20)).padding(5).offset(x:0, y:0)
                    Spacer()
                    
                }
                Spacer()
                ImageView(imageUrl: realURL)
            }.frame(width:.infinity, height:200).padding(2)
            
        }.frame(width:.infinity, height:200).padding(2)
    }
}

struct ThisView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
