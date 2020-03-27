// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReduxMe",
    products: [
        .library(
            name: "ReduxMe",
            targets: ["ReduxMe"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ReduxMe",
            dependencies: []),
        .testTarget(
            name: "ReduxMeTests",
            dependencies: ["ReduxMe"]),
    ]
)
