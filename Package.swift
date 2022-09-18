// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "sink-swift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "Sink",
            targets: ["Sink"]),
    ],
    targets: [
        .target(
            name: "Sink"),
        .testTarget(
            name: "SinkTests",
            dependencies: ["Sink"]),
    ]
)
