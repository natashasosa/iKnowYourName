//
//  DetailView.swift
//  iKnowYourName
//
//  Created by Natasha Rebelo on 28/09/23.
//

import SwiftUI

struct DetailView: View {
    let person: Person

    var body: some View {
        VStack {
            Spacer()
            
            person.displayImage
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(5)
                .padding(.bottom, 20)

            Text("I am \(person.name)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)

            Text("Profession: \(person.profession)")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)

            Text("Description:")
                .font(.headline)
                .padding(.bottom, 5)

            Text(person.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
            Spacer()
        }
        .padding()
        .navigationBarTitle("\(person.firstName)'s profile", displayMode: .inline)
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person(id: UUID(), name: "name", profession: "profession", description: "description"))
    }
}
