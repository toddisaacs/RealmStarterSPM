//
//  ContentView.swift
//  RealmStarterSPM
//
//  Created by Todd Isaacs on 5/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PeopleListView()
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
