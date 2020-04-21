// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokeClient",
    products: [
        .library(
            name: "PokeClient",
            targets: ["PokeClient"]),
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/persiogv/Core", from: "0.0.17")
    ],
    targets: [
        .target(
            name: "PokeClient",
            dependencies: ["Core"]),
        .testTarget(
            name: "PokeClientTests",
            dependencies: ["PokeClient"]),
    ]
)
