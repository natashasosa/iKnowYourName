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
                        let newPerson = Person(id: id, name: name)
                        myContacs.people.append(newPerson)
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
