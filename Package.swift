// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppulizeStandardTools",
    platforms: [.iOS(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(
            name: "AppulizeStandardTools",
            targets: ["AppulizeStandardTools"]),
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/CollectionConcurrencyKit.git", from: .init(0, 2, 0)),
        .package(url: "https://github.com/Appulize/DebugLog.git", from: .init(1, 0, 0)),
    ],
    targets: [
        .target(
            name: "AppulizeStandardTools",
            dependencies: ["CollectionConcurrencyKit", "DebugLog"]),
    ]
)
