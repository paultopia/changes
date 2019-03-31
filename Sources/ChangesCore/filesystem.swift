import Foundation

func listFiles(_ type: String) -> [String] {
    let files = try! FileManager.default.contentsOfDirectory(atPath: ".").filter { $0.hasSuffix("." + type)}
    return files
}

func getLength(_ fileName: String) -> Int {
    return try! FileManager.default.attributesOfItem(atPath: fileName)[FileAttributeKey.size] as! Int
}
