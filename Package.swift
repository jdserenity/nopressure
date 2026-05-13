// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "NoPressureCore",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(
      name: "NoPressureCore",
      targets: ["NoPressureCore"]
    ),
  ],
  targets: [
    .target(
      name: "NoPressureCore"
    ),
    .testTarget(
      name: "NoPressureCoreTests",
      dependencies: ["NoPressureCore"]
    ),
  ]
)
