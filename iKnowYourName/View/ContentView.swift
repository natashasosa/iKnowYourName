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
    @State private var image: Image?

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    let context = CIContext()


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
                                Text(person.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("I know your name")
            .toolbar {
                HStack {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Label("Add", systemImage: "plus.circle")
                    }

                    Button {
                        showingImagePicker = true
                    } label: {
                        Label("New Picutre", systemImage: "photo.on.rectangle.angled")
                    }
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
