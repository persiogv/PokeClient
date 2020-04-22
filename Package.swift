// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokeClient",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "PokeClient",
            targets: ["PokeClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/persiogv/Core", from: "1.0.2"),
        .package(url: "https://github.com/persiogv/CoreNetworking", from: "1.0.1")
    ],
    targets: [
        .target(
            name: "PokeClient",
            dependencies: ["Core", "CoreNetworking"]),
        .testTarget(
            name: "PokeClientTests",
            dependencies: ["PokeClient"]),
    ]
)
