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
            targets: ["TabBarController", "AllImage", "LikeImage", "DetailInfo", "NetworkService", "Models", "DataKit", "Extansions"]),
    ],
    dependencies: [.package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.4.1"))
                  ],
    targets: [
        
        .target(
            name: "TabBarController",
            dependencies: ["AllImage"]),
        .target(
            name: "AllImage",
            dependencies: ["Models", "Kingfisher", "NetworkService", "DataKit", "DetailInfo"],
            resources: [.process("Media.xcassets")]),
        .target(
            name: "LikeImage",
            dependencies: ["DataKit", "Kingfisher"]),
        .target(
            name: "DetailInfo",
            dependencies: ["Models", "Kingfisher", "NetworkService", "DataKit"]),
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

