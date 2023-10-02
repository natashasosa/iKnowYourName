//
//  AddView.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 29/09/23.
//

import SwiftUI

struct AddView: View {
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var profession = ""
    @State private var id = UUID()

    @StateObject var viewModel: MainView.ViewModel

    @State private var image: Image?
    @State private var filterIntensity = 0.5

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    let context = CIContext()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Picture (tap to add photo)")) {
                    HStack {
                        Spacer()
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 200)
                                .onTapGesture {
                                    showingImagePicker = true
                                }
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 200)
                                .foregroundColor(.gray)
                                .onTapGesture {
                                    showingImagePicker = true
                                }

                        }
                        Spacer()
                    }
                    .padding()
                }

                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Profession", text: $profession)
                    TextField("Description", text: $description)
                }

                Button("Save") {
                    var imageData: Data? = nil
                    if let inputImage = inputImage {
                        if let jpegData = inputImage.jpegData(compressionQuality: 0.8) {
                            imageData = jpegData
                        }
                    }
                    let newPerson = Person(id: id, name: name, profession: profession, description: description, image: imageData)
                    viewModel.people.append(newPerson)
                    viewModel.savePeople() // Save the updated data
                    dismiss()
                }
            }
            .navigationBarTitle("Add new contact", displayMode: .inline)
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView(myContacs: People())
//    }
//}
