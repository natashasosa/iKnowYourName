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

    @StateObject private var myContacts = People()
    @State private var showingAddSheet = false

    var body: some View {
        NavigationView {
            VStack {
                if myContacts.people.count < 1 {
                    VStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)

                        Text("You haven't saved anyone yet.")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
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

                                    VStack(alignment: .leading) {
                                        Text(person.name)
                                            .font(.headline)

                                        Text(person.profession)
                                            .font(.body)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .onDelete { indices in
                            if let indexToDelete = indices.first {
                                let personToDelete = myContacts.people[indexToDelete]
                                myContacts.deletePerson(withID: personToDelete.id)
                            }
                        }
                    }
                }
            }
            .navigationTitle("iKnowYourName")
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
