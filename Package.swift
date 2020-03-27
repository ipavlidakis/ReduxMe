// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReduxMe",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "ReduxMe",
            type: .dynamic,
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
