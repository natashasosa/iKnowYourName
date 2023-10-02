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

    let id: UUID
    let name: String
    let profession: String
    let description: String
    let image: Data?
    let location: Location

    //vai ter uma struct de location que é codable
    //person vai receber uma struct de location
    //vai pegar a localizaçao do device no momento em que addview acrescenta a foto

    var firstName: String {
        return name.components(separatedBy: " ").first ?? name
    }
    
    var displayImage: Image {
        if let imageData = image, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)

        } else {
            return Image(systemName: "person.fill") // Placeholder image
        }
    }
}
