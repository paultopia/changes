import Foundation
import xxHash_Swift

func getHash(_ filename: String) -> Int? {
    let data = NSData(contentsOfFile: filename)
    guard let unwrapped = data else {
        return nil
    }
    let toHash = unwrapped as Data
    let hash = xxHash32.digest(toHash)
    return Int(hash)
}
