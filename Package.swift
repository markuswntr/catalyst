// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Catalyst",
    products: [
        .library(name: "Catalyst", targets: ["Catalyst"]),
    ],
    targets: [
        .target(name: "Catalyst"),
    ]
)
