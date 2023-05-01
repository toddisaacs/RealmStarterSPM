//
//  Person.swift
//  RealmStarterSPM
//
//  Created by Todd Isaacs on 5/1/23.
//

import Foundation
import RealmSwift

class Person: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var name: String = ""
  
  convenience init(name: String) {
    self.init()
    self.name = name
  }
}
