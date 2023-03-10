import SwiftUI

struct ItemView: View, Identifiable {
    let id = UUID()
    var Price: Float = 10.00
    var Item: String = "Item Name"
    var PictureURL: String = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).fill(Color.gray)
            HStack(alignment: .top){
                VStack(alignment:.leading){
                    Text("Item").font(.system(size: 50)).padding(5)
                    Text("$"+String(format: "%.2f", Price) ).font(.system(size: 30)).padding(5).offset(x:0, y:0)
                    Spacer()
                    
                }
                Spacer()
                Image("DefaultProfilePic").resizable().frame(width: 150, height: 150).clipShape(Rectangle()).shadow(color: Color.cyan, radius: 10).padding()
            }.frame(width:.infinity, height:200).padding(2)
            
        }.frame(width:.infinity, height:200).padding(2)
    }
}

struct ThisView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
