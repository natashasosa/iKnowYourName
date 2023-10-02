//
//  ContentView.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 22/09/23.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {

    //@StateObject private var viewModel = ViewModel()
    @StateObject private var myContacts = People()
    @State private var showingAddSheet = false

    var body: some View {
        NavigationView {
            VStack {
                if myContacts.people.count < 1 {
                    Text("You haven't saved a person's name yet.")
                } else {
                    List {
                        ForEach(myContacts.people) { person in
                            NavigationLink {
                                DetailView(person: person)
                            } label: {
                                HStack {
                                    person.displayImage
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 55, height: 55)
                                        .clipShape(Circle())

                                    Text(person.name)
                                        .font(.headline)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("I know your name")
            .toolbar {
                Button {
                    showingAddSheet = true
                } label: {
                    Label("Add", systemImage: "plus.circle")
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddView(myContacs: myContacts)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
