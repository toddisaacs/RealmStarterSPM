Current version of Realm 10.38 I found it difficult to setup SPM project where tests and source both worked.  I kept getting errors in testing target.  Found this post using a local package to make the Realm dependencies .dynamic package which works for both source and testing targets.  

https://github.com/realm/realm-swift/issues/8047
 
* Create Project
* Create new Package, include in the same git repo and uncheck the create git repo
* In XCode add package to project
* Edit Project Package.swift 
  * add the RealmSwift dependency (package)
  * add this to the targets below 
  
  ```
  name: "MyRealmPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MyRealmPackage",
            type: .dynamic,
            targets: ["MyRealmPackage"]),
    ],
    dependencies: [
            .package(url: "https://github.com/realm/realm-swift", from: "10.38.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MyRealmPackage",
            dependencies: [
              .product(name: "RealmSwift", package: "realm-swift")
            ]),
        .testTarget(
            name: "MyRealmPackageTests",
            dependencies: ["MyRealmPackage"]),
    ]
        
In Xcode for the project and test targets under build phase link binary with targets


