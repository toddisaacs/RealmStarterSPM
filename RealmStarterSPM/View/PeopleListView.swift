//
//  PeopleListView.swift
//  RealmStarterSPM
//
//  Created by Todd Isaacs on 5/1/23.
//

import SwiftUI
import RealmSwift

struct PeopleListView: View {
  @ObservedResults(
    Person.self,
    sortDescriptor: SortDescriptor(keyPath: "name", ascending: true)
  ) var people
  
  @State private var personFormPresented = false
  
    var body: some View {
      List {
        newPersonButton
        ForEach(people) { person in
          Text(person.name)
        }
      }
    }
  
  @ViewBuilder var newPersonButton: some View {
    Button(action: openNewPersonForm) {
      Label("New Person", systemImage: "plus.circle.fill")
    }
    .foregroundColor(.purple)
    .sheet(isPresented: $personFormPresented) {
      PersonFormView(person: Person())
    }
  }
}

// MARK: - Actions
extension PeopleListView {
  func openNewPersonForm() {
    personFormPresented.toggle()
  }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
