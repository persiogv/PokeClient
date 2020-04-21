// swift-tools-version:5.2
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
        .package(name: "Core", url: "https://github.com/persiogv/Core", from: "1.0.0"),
        .package(name: "CoreNetworking", url: "https://github.com/persiogv/CoreNetworking", from: "1.0.0")
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
