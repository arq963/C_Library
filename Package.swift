// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "C_Library",
    platforms: [
        .iOS(.v13),
//        .iPadOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "C_Library",
            targets: ["C_Library"]
        ),
    ],
    targets: [
        .target(
            name: "C_Library"
        )
    ]
)
