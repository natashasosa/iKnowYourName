//
//  Person.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 28/09/23.
//

import Foundation
import CoreImage
import SwiftUI

struct Person: Identifiable, Codable, Equatable {

    //figuring out how to store image
    let id = UUID()
    let name: String
//    let image: UIImage?


    private enum CodingKeys: String, CodingKey {
        case name
        case imageData
    }

    init(name: String /*image: UIImage?*/) {
        self.name = name
//        self.image = image

    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
//        imageData = try container.decode(Data?.self, forKey: .imageData)
//        image = imageData.flatMap { UIImage(data: $0) }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
//        try container.encode(imageData, forKey: .imageData)
    }
}
