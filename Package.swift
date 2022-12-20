// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImageSPM",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ImageSPM",
            targets: ["Modules", "NetworkService", "Models", "DataKit", "Extansions"]),
    ],
    dependencies: [.package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.4.1"))
                  ],
    targets: [
        
        
        .target(
            name: "Modules",
            dependencies: ["Models", "Kingfisher", "NetworkService", "DataKit"],
            resources: [.process("Media.xcassets")]),
        .target(
            name: "NetworkService",
            dependencies: ["Models"]),
        .target(
            name: "Models",
            dependencies: []),
        .target(
            name: "DataKit",
            dependencies: []),
        .target(
            name: "Extansions",
            dependencies: [])
    ]
)

