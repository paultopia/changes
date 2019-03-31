import ChangesCore

let firstText = getAttributes("txt")[0]
let nom = firstText.name
print("attempting to add: " + nom)

let db = Database()
if let inserted = db.insert(firstText) {
    let fromDB = db.fetch(nom)
    if let retreived = fromDB {
        print(retreived)
    } else {
        print("retrieval failed!")
    }
} else {
    print("insert failed!")
}
