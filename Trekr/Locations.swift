//
//  Locations.swift
//  Trekr
//
//  Created by Andrew Marmion on 22/12/2020.
//

import Foundation

class Locations: ObservableObject {
   let places: [Location]

    @Published var primary: Location

    init() {
        places = Bundle.main.decode([Location].self, from: "locations.json")
        primary = places.randomElement()!
    }

    func randomPlace() {
        primary = places.randomElement()!
    }
}
