//
//  ContentView-ViewModel.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 29/09/23.
//

//import Foundation
//import UIKit
//import SwiftUI
//
//extension ContentView {
//    @MainActor class ViewModel: ObservableObject {
//        @Published var people: [Person]
//
//        @Published var image: Image?
//        @Published var inputImage: UIImage?
//        @Published var showPicker = false
//
//        let context = CIContext()
//
//        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPeople")
//
//        init() {
//            do {
//                let data = try Data(contentsOf: savePath)
//                people = try JSONDecoder().decode([Person].self, from: data)
//            } catch {
//                people = []
//            }
//        }
//
//        
//    }
//}
