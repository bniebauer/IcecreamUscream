//
//  Untitled.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import Foundation
import SwiftUI

struct Icecream: Identifiable, Codable {
    var id: String
    var flavor: String
    var basePrice: Double
    var imageString: String {
        flavor
    }
}

extension Icecream {
    var image: Image {
        Image(imageString)
    }
}
