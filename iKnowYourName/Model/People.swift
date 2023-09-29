//
//  People.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 29/09/23.
//

import Foundation

class People: ObservableObject {
    @Published var people: [Person]

    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPeople")

    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            people = [Person(id: UUID(),name: "testing")]
        }
    }
    
}
