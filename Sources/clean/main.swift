
import Rainbow
import PathKit
import Foundation
import CommandLineKit

let  originPath = "/Users/liuruilong/Downloads"

let cli = CommandLineKit.CommandLine()

let extensionName = StringOption(shortFlag: "e", longFlag: "extension", helpMessage: "extension name")

let fileType = StringOption(shortFlag: "f", longFlag: "fileType", helpMessage: """
                    file type:
                         image - image
                         video - video
                         music - music
                 """)


let toPath = StringOption(shortFlag: "t", longFlag: "toPath", helpMessage: "move to path")

let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "Prints a help message.")

cli.addOptions(extensionName, fileType, toPath, help)

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.blue
    default:
        str = s
    }
    return cli.defaultFormat(s: str, type: type)
}

if !cli.unparsedArguments.isEmpty {
    print("Unknow arguments: \(cli.unparsedArguments)".red)
    cli.printUsage()
    exit(EX_USAGE)
}

if help.value {
    cli.printUsage()
    exit(EX_OK)
}

//print(toPath.value!)
//print(extensionName.value!)

if let inToPath = toPath.value, let fileType = fileType.value{
    getMoveTo(t: fileType).moveTo(to: inToPath)
}



//if let inToPath = toPath.value, let inExtensionName = extensionName.value{
//
//
//
//    let files = Path.init(originPath)
//    do{
//        let childrenFiles = try files.children()
//       childrenFiles.filter{$0.string.hasSuffix(inExtensionName)}.forEach{
//                let shell = Shell.init(order: "mv", arguments: [$0.string, inToPath], orderPath: "/bin/")
//                shell.run()
//            }
//    }catch{
//
//    }
//}
//











