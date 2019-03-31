func getAttributes(_ type: String) -> [Attributes] {
    let files = listFiles(type)
    return files.map({Attributes($0)})
}

func isChanged(file: Attributes, db: Database) -> Attributes? {
    guard let retrieved = db.fetch(file.name) else {return file}
    if retrieved == file {
        return nil
    }
    return file
}

public func testFiles(_ type: String) -> [String] {
    var changed = [String]()
    let db = Database()
    let files = getAttributes(type)
    for file in files {
        if let changes = isChanged(file: file, db: db) {
            changed.append(file.name)
            let _ = db.upsert(file)
        }
    }
    return changed
}
