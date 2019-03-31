import ChangesCore
import Foundation

let args = CommandLine.arguments

switch args.count {
case 1:
    print("pass a file extension, no period, as the argument")
default:
    let changedFiles = testFiles(args[1])
    for file in changedFiles {
        print(file)
    }
}
