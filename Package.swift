// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBSwiftWrapper",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v8),
        .tvOS(.v10)
    ],
    products: [
        .library(
            name: "TMDBSwift",
            targets: ["TMDBSwift"]),
    ],
    targets: [
        .target(
            name: "TMDBSwift",
            dependencies: [],
            path: "Sources"
            )
    ],
    swiftLanguageVersions: [.v4]
)
