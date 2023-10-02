//
//  MainViewViewModel.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 29/09/23.
//

import Foundation

extension MainView {

    @MainActor
    class ViewModel: ObservableObject {

        @Published var people: [Person]

        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPeople")

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people = []
            }
        }

        func savePeople() {
            do {
                let data = try JSONEncoder().encode(people)
                try data.write(to: savePath)
            } catch {
                print("Error saving people: \(error)")
            }
        }

        func deletePerson(withID id: UUID) {
            if let index = people.firstIndex(where: { $0.id == id }) {
                people.remove(at: index)
                savePeople() // Save the updated data after deletion
            }
        }
    }
}
