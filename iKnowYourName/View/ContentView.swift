//
//  ContentView.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.people) { person in
                    NavigationLink {
                        DetailView(person: person)
                    } label: {
                        Text(person.name)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
