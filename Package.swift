// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swifticon",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Swifticon",
            targets: ["Swifticon"]),
    ],
    targets: [
        .target(
            name: "Swifticon",
            dependencies: []),
        .testTarget(
            name: "SwifticonTests",
            dependencies: ["Swifticon"]),
    ]
)
