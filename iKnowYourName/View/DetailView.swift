//
//  DetailView.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 28/09/23.
//

import SwiftUI

struct DetailView: View {
    let person: Person

    var body: some View {
        VStack {
            if let imageData = person.image, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    //.frame(width: 100, height: 100) // Adjust the size as needed
                    .cornerRadius(10) // Add a corner radius if desired
            } else {
                Image(systemName: "person.fill") // Placeholder image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100) // Adjust the size as needed
                    .cornerRadius(10) // Add a corner radius if desired
            }

            Text("Hey, I am \(person.name)")
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person(id: UUID(), name: "name"))
    }
}
