Current version of Realm 10.38 I found it difficult to setup SPM project where tests and source both worked.  I kept getting errors in testing target.  Found this post using a local package to make the Realm dependencies .dynamic package which works for both source and testing targets.  

https://github.com/realm/realm-swift/issues/8047
 
* Create Project
* Create new Package, include in the same git repo and uncheck the create git repo
* In XCode add package to project
* Edit Project Package.swift 
  * add the RealmSwift dependency (package)
  * add this to the targets below 
  
  ```swift
  dependencies: [
        .package(url: "https://github.com/realm/realm-swift", from: "10.38.3")
    ],
    targets: [
        .target(
            name: "MyPackageForRealm",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")]),
        .testTarget(
        
In Xcode for the project and test targets under build phase link binary with targets


