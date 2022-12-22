// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImageSPM",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ImageSPM",
            targets: ["ImageForSferaPackege"]),
    ],
    dependencies: [.package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.4.1"))
                  ],
    targets: [
        
        
        .target(
            name: "ImageForSferaPackege",
            dependencies: ["Kingfisher"],
            resources: [.process("Media.xcassets")])
    ]
)

