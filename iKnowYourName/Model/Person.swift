//
//  Person.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 28/09/23.
//

import Foundation
import CoreImage
import SwiftUI
import MapKit

struct Person: Codable, Identifiable {

    let id: UUID
    let name: String
    let profession: String
    let description: String
    let image: Data?
    let location: Location

    var mapRegion: MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    }

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
