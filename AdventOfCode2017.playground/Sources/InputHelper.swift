import Foundation

public func stringFromResource(_ resourceName: String, fileExtension: String = "txt") -> String {
    let inputURL = Bundle.main.url(forResource: resourceName, withExtension: fileExtension)!
    let input = try! String(contentsOf: inputURL, encoding: String.Encoding.utf8)
    return input
}
