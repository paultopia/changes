import Foundation
import xxHash_Swift

public func sayBye() {
    print("bye computer")
}

public func getLength(_ fileName: String) -> Int {
    return try! FileManager.default.attributesOfItem(atPath: fileName)[FileAttributeKey.size] as! Int
}
