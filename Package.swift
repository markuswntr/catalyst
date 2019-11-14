// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Catalyst",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Catalyst", targets: ["Catalyst"]),
    ],
    targets: [
        .target(name: "Catalyst"),
    ]
)
