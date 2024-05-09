// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Unrealm",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "UnrealmObjC", targets: ["UnrealmObjC"]),
        .library(name: "Unrealm", targets: ["Unrealm", "UnrealmObjC"])
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", exact: "10.49.1"),
        .package(url: "https://github.com/wickwirew/Runtime.git", from: "2.2.2")
    ],
    targets: [
        .target(
            name: "UnrealmObjC",
            dependencies: [
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
            ],
            path: "Unrealm/Classes/ObjC"
        ),
        .target(
            name: "Unrealm",
            dependencies: [
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
                "UnrealmObjC", "Runtime"
            ],
            path: "Unrealm/Classes/Swift"
        )
    ],
    swiftLanguageVersions: [.v5]
)
