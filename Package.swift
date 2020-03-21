// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WAFoundation",
    products: [
        .library(
            name: "WAFoundation",
            targets: ["WAFoundation"]),
    ],
    targets: [
        .target(
            name: "WAFoundation",
            dependencies: []),
    ]
)
