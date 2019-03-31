import ChangesCore

func addText(text: Attributes, db: Database){
    let nom = text.name
    print("attempting to add: " + nom)

    if let inserted = db.upsert(text) {
        print("insert succeeded")
    } else {
        print("insert failed!")
    }

    if let retreived = db.fetch(nom) {
        print(retreived)
    } else {
        print("retrieval failed!")
    }

}



let texts = getAttributes("txt")
let db = Database()
for text in texts {
    addText(text: text, db: db)
}

