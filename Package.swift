// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MultiBlur",
    platforms: [
        .iOS(.v13),
        .macOS(.v12),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "MultiBlur",
            targets: ["MultiBlur"]),
    ],
    targets: [
        .target(
            name: "MultiBlur"),
        .testTarget(
            name: "MultiBlurTests",
            dependencies: ["MultiBlur"]
        ),
    ]
)
