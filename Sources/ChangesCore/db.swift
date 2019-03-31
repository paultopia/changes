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

    // func insert(_ f: Attributes) -> Int64? {
    //     let ins = files.insert(self.name <- f.name, self.length <- f.length, self.hash <- f.hash)
    //     let results = try? db.run(ins)
    //     return results
    // }

    func fetch(_ fileName: String) -> Row? {
        let query = files.filter(name == fileName)
        let output = try? db.prepare(query)
        if let res = output {
            let row = Array(res)[0]
            return row
            //return Attributes(row)
        } else {
            return nil
        }
    }

    func update(fileName: String, attributes: Attributes) {
        print("not implemented")
    }

    func delete(_ name: String) {
        print("not implemented")
    }
}

// extension Attributes {
//     init(_ row: Row){
//         name = row.name
//         length = row.length
//         hash = row.hash
//     }
// }
