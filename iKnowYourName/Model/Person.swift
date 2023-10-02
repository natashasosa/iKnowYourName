//
//  Person.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 28/09/23.
//

import Foundation
import CoreImage
import SwiftUI

struct Person: Codable, Identifiable {

    //figuring out how to store image
    let id: UUID
    let name: String
    var image: Data?

    var displayImage: Image {
        if let imageData = image, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)

        } else {
            return Image(systemName: "person.fill") // Placeholder image
        }
    }
}
