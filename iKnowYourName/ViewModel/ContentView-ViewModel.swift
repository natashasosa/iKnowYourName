//
//  ContentView-ViewModel.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 29/09/23.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var people: [Person]
        @Published var showPicker = false

        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPeople")

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people = []
            }
        }
    }
}
