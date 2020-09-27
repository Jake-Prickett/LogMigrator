// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogMigrator",
    platforms: [.iOS("12.0")],
    products: [
        .library(name: "LogMigrator", targets: ["LogMigrator"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "LogMigrator",
            dependencies: [],
            path: "Sources/"),
        .testTarget(
            name: "LogMigratorTests",
            dependencies: ["LogMigrator"],
            path: "Tests/"),
    ]
)
