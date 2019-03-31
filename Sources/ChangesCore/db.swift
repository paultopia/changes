import Foundation
import SQLite

public struct Database{
    let db: Connection
    let files: Table
    let name = Expression<String>("name")
    let length = Expression<Int>("length")
    let hash = Expression<Int>("hash")

    public init() {
        db = try! Connection(".changes.sqlite3")
        files = Table("files")
        try! db.run(files.create(ifNotExists: true) { t in
                       t.column(name, primaryKey: true)
                       t.column(length)
                       t.column(hash)
                    })
    }

    public func upsert(_ f: Attributes) -> Int64? {
        let ins = files.insert(or: .replace, self.name <- f.name, self.length <- f.length, self.hash <- f.hash)
        let results = try? db.run(ins)
        return results
    }

    public func fetch(_ fileName: String) -> Attributes? {
        let name = self.name  // seemingly necessarily boilerplate to accommodate silliness with sqlite library column names
        let hash = self.hash
        let length = self.length 
        let query = files.filter(name == fileName)
        let output = try? db.prepare(query)
        if let res = output {
            let row = Array(res)[0]
            let n = try! row.get(name)
            let l = try! row.get(length)
            let h = try! row.get(hash)
            return Attributes(n: n, l: l, h: h)
        } else {
            return nil
        }
    }

    func delete(_ name: String) {
        print("not implemented")
    }
}

