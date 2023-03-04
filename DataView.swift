import Foundation
import SwiftUI



struct DataView: View {
    var sText: String
    @State private var myValue: String = ""
    @State var thisList: [ItemView] = getProducts(thisString: "  ")//myString ?? "")
    
    var body: some View {
        ScrollView{
            //ItemView(Price: thisPrice, Item: thisName, PictureURL: "120912")
            ForEach(thisList, id: \.id) { view in
                view
            }
            Text(myValue).onAppear {
                startLoad(searchText: sText, userCompletionHandler: { myString, error in
                    if myString != nil{
                        myValue = myString ?? "loading..."
                        print(thisList.count)
                        thisList = getProducts(thisString: myString ?? "  ")
                        //thisPrice = thisList[1].Price
                        //thisName = thisList[1].Item
                    }
                })
            }
        }
    }
    
}

func startLoad(searchText: String, userCompletionHandler: @escaping (String?, Error?) -> Void) {
    let url = URL(string: "https://www.heb.com/search/?q=spam")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            return
        }
        if let mimeType = httpResponse.mimeType, mimeType == "text/html",
            let data = data,
            let string = String(data: data, encoding: .utf8) {
            //print(string)
            userCompletionHandler(string, nil)
        }
    }
    task.resume()
}

func getProducts(thisString: String) -> [ItemView]{
    var thisList: [ItemView] = []
    let scanner = Scanner(string: thisString)
    while !scanner.isAtEnd {
        var scannedString: String?
        scannedString = scanner.scanUpToString("small/")
        //print(scannedString)
        var thisItem = assignProducts(thisString: scannedString ?? "hi")
        if(thisItem.Price != 0.00){
            thisList.append(thisItem)
        }
        scannedString = scanner.scanString("small/")
    }
    return thisList
}

func assignProducts(thisString: String) -> ItemView{
    let scanner = Scanner(string: thisString)
    var scannedString: String
    scannedString = scanner.scanUpToString(".") ?? ""
    _ = scanner.scanString(".")
    _ = scanner.scanUpToString("alt=\"")
    _ = scanner.scanString("alt=\"")
    
    var scannedString2: String
    scannedString2 = scanner.scanUpToString(",") ?? ""
    _ = scanner.scanString(",")
    
    var scannedString3: String
    scannedString3 = scanner.scanUpToString(" each") ?? " "
    var indeX = scannedString3.lastIndex(of: "$") ?? scannedString3.startIndex
    var price: String = String(scannedString3[indeX..<scannedString3.endIndex])
    var newStartIndex = price.startIndex
    newStartIndex = price.index(newStartIndex, offsetBy: 1)
    let newEndIndex = price.endIndex
    price = String(price[newStartIndex..<newEndIndex])
    return ItemView(Price: Float(price) ?? 0.00, Item: scannedString2, PictureURL: scannedString)
}
