// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "DPSDKKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DPSDKKit",
            targets: ["DPSDKKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DPSDKKit",
            path: "DPSDKKit.xcframework"
        )
    ]
)
