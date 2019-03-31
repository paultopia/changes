// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "changes",
    dependencies: [
      .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.11.5"),
      .package(url: "https://github.com/daisuke-t-jp/xxHash-Swift.git", from: "1.0.10"),
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
