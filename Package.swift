// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Log",
    products: [
        .library(name: "Log", targets: ["Log"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-code/test.git",
            .branch("master"))
    ],
    targets: [
        .target(name: "Log"),
        .testTarget(name: "LogTests", dependencies: ["Log", "Test"])
    ]
)
