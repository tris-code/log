// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Log",
    products: [
        .library(name: "Log", targets: ["Log"])
    ],
    dependencies: [
        .package(path: "../test")
    ],
    targets: [
        .target(name: "Log"),
        .testTarget(name: "LogTests", dependencies: ["Log", "Test"])
    ]
)
