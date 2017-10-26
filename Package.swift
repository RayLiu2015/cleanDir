// swift-tools-version:3.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "clean",
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        
        Target(
            name: "clean",
            dependencies: []),
        ],
    dependencies: [
        .Package(url: "https://github.com/jatoben/CommandLine", "3.0.0-pre1"),
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 2),
        .Package(url: "https://github.com/kylef/PathKit.git", majorVersion: 0, minor: 8)
    ]
)

