// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "promisify",
  platforms: [.iOS(.v13),
              .macOS(SupportedPlatform.MacOSVersion.v10_15)],
  products: [
    .library(
      name: "promisify",
      targets: ["promisify"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "promisify",
      dependencies: []),
  ]
)
