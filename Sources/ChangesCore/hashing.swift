import Foundation
import xxHash_Swift

func getHash(_ filename: String) -> Int? {
    let data = try? String(contentsOfFile: filename)
    guard let toHash = data else {
        return nil
    }
    let hash = xxHash32.digest(toHash)
    return Int(hash)
}
