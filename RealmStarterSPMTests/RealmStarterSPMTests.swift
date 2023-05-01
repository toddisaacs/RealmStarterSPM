//
//  RealmStarterSPMTests.swift
//  RealmStarterSPMTests
//
//  Created by Todd Isaacs on 5/1/23.
//

import XCTest
import MyRealmPackage
@testable import RealmStarterSPM
import RealmSwift

final class RealmStarterSPMTests: XCTestCase {

  private var realm:Realm?
  
    override func setUpWithError() throws {
      Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
      realm = try! Realm()
    }

    override func tearDownWithError() throws { }

    func testPersonCreationAndRetrieve() throws {
      let person1 = Person(name: "Test 1")
      let person2 = Person(name: "Test 2")
      let person3 = Person(name: "Test 3")
      
      try! realm!.write {
        realm!.add([person1, person2, person3])
      }
      
      let people = realm?.objects(Person.self)
      XCTAssertEqual(people!.count, 3)
      
      //Verify Realm association
      XCTAssertNotNil(people![0].realm)
    }
}
