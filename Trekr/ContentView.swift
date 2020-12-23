//
//  ContentView.swift
//  Trekr
//
//  Created by Andrew Marmion on 22/12/2020.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locations: Locations
    let location: Location
    let allowRandom: Bool

    init(location: Location, allowRandom: Bool = false) {
        self.location = location
        self.allowRandom = allowRandom
    }
    
    var body: some View {
        ScrollView {
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()

            Text(location.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Text(location.country)
                .font(.title)
                .foregroundColor(.secondary)

            Text(location.description)
                .padding(.horizontal)

            Text("Did you know?")
                .font(.title3)
                .bold()
                .padding(.top)

            Text(location.more)
                .padding(.horizontal)
        }
        .navigationTitle("Discover")

        .if(allowRandom) { view in
            view
                .navigationBarItems(trailing: Button(action: {
                    locations.randomPlace()
                }, label: {
                    Image(systemName: "shuffle")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(location: Location.example, allowRandom: true)
                .environmentObject(Locations())
        }
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        }
        else {
            self
        }
    }
}
