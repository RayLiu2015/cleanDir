//
//  MoveTo.swift
//  CommandLineDemoPackageDescription
//
//  Created by liuRuiLong on 2017/10/21.
//

import PathKit
import Foundation

func getMoveTo(t: String = "p") -> MoveToProtocol{
    if t.lowercased() == "image" {
        return ImageMoveTo.init()
    }else if t.lowercased() == "video"{
        return VideoMoveTo.init()
    }else if t.lowercased() == "music"{
        return MusicMoveTo.init()
    }
    exit(EX_USAGE)
}

protocol MoveToProtocol {
    var extensions: [String]{get}
    func moveTo(to: String)
}

extension MoveToProtocol{
    
    func moveTo(to: String) {
        let path = Path.init(originPath)
        do{
            let childrenFiles = try path.children()
            
            childrenFiles.filter{(childFile) -> Bool in
//                print(childFile.string)
                print(extensions)
                for extensionN in extensions{
                    print(extensionN)
                    if childFile.string.hasSuffix(extensionN){
                        return true
                    }
                }
                return false
                }.forEach{
                    print($0.string)
                    print(to)
                    let shell = Shell.init(order: "mv", arguments: [$0.string, to], orderPath: "/bin/")
                    shell.run()
            }
        }catch{
            
        }
    }
}
struct ImageMoveTo: MoveToProtocol{
    var extensions: [String] = ["jpg", "jpeg", "JPG", "png", "gif"]
}

struct VideoMoveTo: MoveToProtocol {
    var extensions: [String] = ["mp4", "flv", "rmvb", "mov", "m3u8"]
}


struct MusicMoveTo: MoveToProtocol {
    var extensions: [String] = ["mp3"]
}



