import Foundation

public func listFiles(_ type: String) -> [String] {
    let files = try! FileManager.default.contentsOfDirectory(atPath: ".").filter { $0.hasSuffix("." + type)}
    return files
}
