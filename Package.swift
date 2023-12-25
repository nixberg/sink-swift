// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "sink-swift",
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
