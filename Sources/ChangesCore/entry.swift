public func getAttributes(_ type: String) -> [Attributes] {
    let files = listFiles(type)
    return files.map({Attributes($0)})
}
