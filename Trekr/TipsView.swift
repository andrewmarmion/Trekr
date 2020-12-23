//
//  TipsView.swift
//  Trekr
//
//  Created by Andrew Marmion on 23/12/2020.
//

import SwiftUI

struct TipsView: View {
    let tips: [Tip]

    init() {
        tips = Bundle.main.decode([Tip].self, from: "tips.json")
    }

    var body: some View {
        List(tips, id: \.text, children: \.children) { tip in
            if tip.children != nil {
            Label(tip.text, systemImage: "quote.bubble")
                .font(.headline)
            } else {
                Text(tip.text)
            }
        }
        .navigationTitle("Tips")
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TipsView()
        }
    }
}
