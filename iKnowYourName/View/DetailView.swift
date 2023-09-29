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
        Text("Hey, I am \(person.name)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person(id: UUID(), name: "name"))
    }
}
