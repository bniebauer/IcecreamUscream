//
//  Untitled.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 3/12/25.
//

import Foundation

struct Icecream: Identifiable, Codable {
    var id: String
    var flavor: String
    var basePrice: Double
    
    
}

struct CartItem: Codable {
    var icecream: Icecream
    
    var toppings: [String]
    var scoops: Int
    
    var total: Double {
        (icecream.basePrice * Double(scoops)) + (Double(toppings.count) * 0.5)
    }
}

struct Order: Identifiable, Codable {
    var id: String
    
    var selection: [CartItem]
    
    var price: Double {
        selection.reduce(0) { $0 + $1.total }
    }
}
