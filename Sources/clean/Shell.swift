//
//  Shell.swift
//  MovieServerPackageDescription
//
//  Created by liuRuiLong on 2017/10/21.
//

import Foundation


struct Shell {
    var order: String
    var orderPath: String = "/usr/bin/"
    var arguments: [String]
    init(order: String, arguments: [String], orderPath: String = "/usr/bin/") {
        self.order = order
        self.arguments = arguments
        self.orderPath = orderPath
    }
    func run() {
        let pipe = Pipe.init()
        let p = Process.init()
        p.launchPath = orderPath + order
        p.arguments = arguments
        p.standardOutput = pipe
        p.launch()
    }
}
