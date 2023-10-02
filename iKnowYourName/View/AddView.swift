//
//  AddView.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 29/09/23.
//

import SwiftUI

//Ultima coisa feita: conseguir adicionar foto a view. Ainda é necessário ver como atribuir ao usuario e salvar tudo no directory

struct AddView: View {
    @Environment (\.dismiss) var dismiss
    @State private var name = ""
    @State private var id = UUID()
    @StateObject var myContacs: People


    //picture testing
    @State private var image: Image?
    @State private var filterIntensity = 0.5

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    //@State private var processedImage: UIImage?

    //@State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()



    var body: some View {
        NavigationView {
            VStack {
                Text("Tap to select a picture")

                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.gray)
                        .onTapGesture {
                            showingImagePicker = true
                        }
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.gray)
                        .onTapGesture {
                            showingImagePicker = true
                        }
                }

                Form {
                    TextField("Name: ", text: $name)
                    Button("Save") {
                        var imageData: Data? = nil
                        if let inputImage = inputImage {
                            if let jpegData = inputImage.jpegData(compressionQuality: 0.8) {
                                imageData = jpegData
                            }
                        }
                        let newPerson = Person(id: id, name: name, image: imageData)
                        myContacs.people.append(newPerson)
                        myContacs.savePeople() // Save the updated data
                        dismiss()
                    }
                }
            }
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
