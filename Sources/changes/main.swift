import ChangesCore

let firstText = getAttributes("txt")[0]
let nom = firstText.name
print("attempting to add: " + nom)

let db = Database()
if let inserted = db.insert(firstText) {
    print("insert succeeded")
} else {
    print("insert failed!")
}

if let retreived = db.fetch(nom) {
    print(retreived)
} else {
    print("retrieval failed!")
}
