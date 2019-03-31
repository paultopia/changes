public struct Attributes {
    public let name: String
    var length: Int
    var hash: Int
    var changed = false
    

    init(_ fileName: String) {
        name = fileName
        length = getLength(fileName)
        hash = getHash(fileName)!
    }

}
