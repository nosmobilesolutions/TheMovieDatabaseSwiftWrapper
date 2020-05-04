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
            name: "TMDBSwiftWrapper",
            targets: ["TMDBSwiftWrapper"]),
    ],
    targets: [
        .target(
            name: "TMDBSwiftWrapper",
            dependencies: [],
            path: "Common"
            )
    ],
    swiftLanguageVersions: [.v4]
)
