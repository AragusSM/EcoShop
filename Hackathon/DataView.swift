import Foundation
import SwiftUI




func startLoad(userCompletionHandler: @escaping (String?, Error?) -> Void) {
    let url = URL(string: "https://www.example.com")!
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
