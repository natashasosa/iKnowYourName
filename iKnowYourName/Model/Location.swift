//
//  Location.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 02/10/23.
//

import Foundation
import CoreLocation

struct Location: Codable {

    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static let example = Location(latitude: 51.501, longitude: -0.141)

}
