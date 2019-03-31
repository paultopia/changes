// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "changes",
    dependencies: [
      .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.11.5"),
      .package(url: "https://github.com/daisuke-t-jp/xxHash-Swift.git", .exact("1.0.9")),
    ],
    targets: [
      .target(
        	name: "changes",
        	dependencies: ["ChangesCore"]),
	.target(
		name: "ChangesCore",
		dependencies: ["xxHash-Swift", "SQLite"]),
  .testTarget(
    name: "ChangesTest",
    dependencies: ["ChangesCore"])
    ]
)
