//
//  PersonFormView.swift
//  RealmStarterSPM
//
//  Created by Todd Isaacs on 5/1/23.
//

import SwiftUI
import RealmSwift

struct PersonFormView: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.realm) var realm
  
  @ObservedRealmObject var person: Person
  
  var isUpdating: Bool {
    person.realm != nil
  }
  
    var body: some View {
      NavigationView {
        Form {
          TextField("Name", text: $person.name)
        }
        .navigationTitle("New Person")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .confirmationAction) {
            Button(isUpdating ? "Done" : "Save") {
              if isUpdating {
                dismiss()
              } else {
                save()
              }
            }
            .disabled(person.name.isEmpty)
          }
        }
      }
    }
}

// MARK: - Actions
extension PersonFormView {
  func save() {
    try? realm.write {
      print("Adding Person To Realm")
      realm.add(person)
    }
    dismiss()
  }
}

struct PersonFormView_Previews: PreviewProvider {
    static var previews: some View {
      PersonFormView(person: Person())
    }
}
