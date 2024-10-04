// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AmpleMock",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AmpleMock",
            targets: [
                "AmpleMock"
            ])
    ],
    targets: [
        .target(
            name: "AmpleMock"),
        .testTarget(
            name: "AmpleMockTests",
            dependencies: [
                "AmpleMock"
            ])
    ]
)
