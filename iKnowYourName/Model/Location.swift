//
//  Location.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 02/10/23.
//

import Foundation
import CoreLocation

struct Location: Codable, Equatable {

    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static let example = Location(latitude: 51.501, longitude: -0.141)

    static func ==(lhs: Location, rhs: Location) -> Bool {
        if lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude {
            return true
        }

        return false
    }
}
