// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImageSPM",
    products: [
        .library(
            name: "ImageSPM",
            targets: ["TabBarController", "AllImage", "LikeImage", "DetailInfo"]),
    ],
    dependencies: [
    ],
    targets: [
        
        .target(
            name: "TabBarController",
            dependencies: []),
        .target(
            name: "AllImage",
            dependencies: []),
        .target(
            name: "LikeImage",
            dependencies: []),
        .target(
            name: "DetailInfo",
            dependencies: [])
    ]
)
