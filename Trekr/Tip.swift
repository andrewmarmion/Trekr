//
//  Tip.swift
//  Trekr
//
//  Created by Andrew Marmion on 23/12/2020.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}
