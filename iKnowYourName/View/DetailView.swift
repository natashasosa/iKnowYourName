//
//  DetailView.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 28/09/23.
//

import SwiftUI
import MapKit

struct DetailView: View {
    let person: Person
    @State var mapRegion: MKCoordinateRegion

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                person.displayImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(5)
                    .padding(.bottom, 20)

                Text("I am \(person.name)")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text("Profession: \(person.profession)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)

                Text("Description:")
                    .font(.headline)

                Text(person.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)


                Text("Where you met: ")
                    .font(.headline)
                    .padding(.bottom, 5)

                Map(coordinateRegion: $mapRegion, showsUserLocation: false, annotationItems: [person.location]) { location in
                    MapMarker(coordinate: location.coordinate, tint: .red)
                }
                .frame(height: 350)

            }
            .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
            .navigationBarTitle("\(person.firstName)'s profile", displayMode: .inline)
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(person: Person(id: UUID(), name: "name", profession: "profession", description: "description"))
//    }
//}
